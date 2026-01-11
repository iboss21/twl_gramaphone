--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    CLIENT INTERACTION SYSTEM
    www.wolves.land | Created by iBoss
    The Land of Wolves - Authentic 1899 Music Experience
    
    This file handles:
    - Keybind detection and interaction prompts (ALT key)
    - 3D text display above gramophones
    - NUI menu opening and closing
    - Player input callbacks from UI
    - Menu state management
]]

-- Brand protection markers
local INTERACTION_BRAND = "iBoss_TheLandOfWolves_" .. "www.wolves.land"

local isMenuOpen = false

-- ════════════════════════════════════════════════════════════════
--  KEYBIND INTERACTION
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    while true do
        Wait(Config.PromptMenuOpenDelay)
        
        local nearestGramophone = GetNearestGramophone()
        
        if nearestGramophone and not isMenuOpen then
            -- Show 3D prompt if enabled
            if Config.ShowPrompt3D then
                DrawText3D(nearestGramophone.coords.x, nearestGramophone.coords.y, nearestGramophone.coords.z + Config.Prompt3DHeightOffset, 
                    Config.Prompt3DText)
            end
            
            -- Check for keybind press
            if IsControlJustPressed(0, GetControlFromKey(Config.InteractionKey)) then
                OpenGramophoneMenu(nearestGramophone)
            end
        else
            Wait(Config.PromptAwayDelay)
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
        -- RedM compatible text rendering natives
        SetTextScale(Config.Prompt3DTextScale * scale, Config.Prompt3DTextScale * scale)
        SetTextColor(255, 255, 255, 215)
        SetTextCentre(true)
        SetTextDropshadow(1, 0, 0, 0, 255)
        
        -- Use RedM text rendering
        local str = CreateVarString(10, "LITERAL_STRING", text)
        DisplayText(str, _x, _y)
    end
end

function GetControlFromKey(key)
    -- Map key names to RedM controls
    return Config.KeyMap[key] or Config.KeyMap['LMENU'] -- Default to ALT
end

-- Close menu on ESC
CreateThread(function()
    while true do
        Wait(Config.MenuCloseCheckDelay)
        
        if isMenuOpen then
            if IsControlJustPressed(0, Config.KeyMap['ESC']) then -- ESC/BACKSPACE
                CloseGramophoneMenu()
            end
        else
            Wait(Config.MenuCloseAwayDelay)
        end
    end
end)
