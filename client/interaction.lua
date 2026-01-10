-- 🐺 Client Interaction System
-- www.wolves.land | Created by iBoss

local isMenuOpen = false

-- ════════════════════════════════════════════════════════════════
--  KEYBIND INTERACTION
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    while true do
        Wait(0)
        
        local nearestGramophone = GetNearestGramophone()
        
        if nearestGramophone and not isMenuOpen then
            -- Show 3D prompt if enabled
            if Config.ShowPrompt3D then
                DrawText3D(nearestGramophone.coords.x, nearestGramophone.coords.y, nearestGramophone.coords.z + 1.0, 
                    "Press ~y~[ALT]~w~ to use Gramophone")
            end
            
            -- Check for keybind press
            if IsControlJustPressed(0, GetControlFromKey(Config.InteractionKey)) then
                OpenGramophoneMenu(nearestGramophone)
            end
        else
            Wait(500)
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  MENU FUNCTIONS
-- ════════════════════════════════════════════════════════════════

function OpenGramophoneMenu(gramophone)
    isMenuOpen = true
    
    -- Send gramophone data to NUI
    SendNUIMessage({
        action = "openMenu",
        gramophone = {
            netId = gramophone.netId,
            coords = gramophone.coords,
            distance = gramophone.distance
        },
        playlists = Playlists,
        config = {
            volume = Config.DefaultVolume,
            enableCost = Config.EnableCost,
            costPerSong = Config.CostPerSong
        }
    })
    
    SetNuiFocus(true, true)
    Utils.Debug("Opened gramophone menu")
end

function CloseGramophoneMenu()
    isMenuOpen = false
    
    SendNUIMessage({
        action = "closeMenu"
    })
    
    SetNuiFocus(false, false)
    Utils.Debug("Closed gramophone menu")
end

-- ════════════════════════════════════════════════════════════════
--  NUI CALLBACKS
-- ════════════════════════════════════════════════════════════════

RegisterNUICallback('playTrack', function(data, cb)
    Utils.Debug("Player selected: " .. data.playlistId .. " track " .. data.trackIndex)
    
    TriggerServerEvent('twl_gramophone:server:playTrack', data.gramophoneNetId, data.playlistId, data.trackIndex)
    
    CloseGramophoneMenu()
    cb('ok')
end)

RegisterNUICallback('stopTrack', function(data, cb)
    Utils.Debug("Player stopped track")
    
    TriggerServerEvent('twl_gramophone:server:stopTrack', data.gramophoneNetId)
    
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    CloseGramophoneMenu()
    cb('ok')
end)

-- ════════════════════════════════════════════════════════════════
--  HELPER FUNCTIONS
-- ════════════════════════════════════════════════════════════════

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    if onScreen then
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function GetControlFromKey(key)
    -- Map key names to RedM controls
    local keyMap = {
        ['LMENU'] = 0xD8F73058, -- Left Alt (ALT)
        ['E'] = 0xCEFD9220,
        ['ENTER'] = 0xC7B5340A,
        ['BACKSPACE'] = 0x156F7119,
        ['ESC'] = 0x156F7119
    }
    
    return keyMap[key] or 0xD8F73058 -- Default to ALT
end

-- Close menu on ESC
CreateThread(function()
    while true do
        Wait(0)
        
        if isMenuOpen then
            if IsControlJustPressed(0, 0x156F7119) then -- ESC/BACKSPACE
                CloseGramophoneMenu()
            end
        else
            Wait(500)
        end
    end
end)
