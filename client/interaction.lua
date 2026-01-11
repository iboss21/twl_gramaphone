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
local targetSystemDetected = false
local targetSystemName = nil

-- ════════════════════════════════════════════════════════════════
--  TARGET SYSTEM DETECTION & SETUP
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(Config.TargetLoadWaitTime) -- Wait for resources to load
    
    -- Auto-detect target system
    if Config.UseTarget then
        if GetResourceState(Config.TargetResourceNames.ox_target) == 'started' then
            targetSystemDetected = true
            targetSystemName = 'ox_target'
            Utils.Debug(Config.Messages.target_detected_ox)
        elseif GetResourceState(Config.TargetResourceNames.rsg_target) == 'started' then
            targetSystemDetected = true
            targetSystemName = 'rsg-target'
            Utils.Debug(Config.Messages.target_detected_rsg)
        else
            Utils.Debug(Config.Messages.target_no_system)
        end
        
        -- Setup target zones for gramophones if target system is available
        if targetSystemDetected then
            SetupTargetZones()
        end
    end
end)

function SetupTargetZones()
    for _, model in ipairs(Config.PhonographModels) do
        if targetSystemName == 'ox_target' then
            exports.ox_target:addModel(model, {
                {
                    name = Config.TargetZoneName or 'twl_gramophone_interact',
                    icon = Config.TargetIcon,
                    label = Config.TargetLabel,
                    distance = Config.InteractionDistance,
                    canInteract = function(entity, distance, data)
                        -- Validate prop before allowing interaction
                        return IsValidGramophoneProp(entity)
                    end,
                    onSelect = function(data)
                        -- Double-check validation before opening menu
                        if not IsValidGramophoneProp(data.entity) then
                            Utils.Debug("Invalid prop detected in target interaction - blocked")
                            return
                        end
                        
                        local gramophone = {
                            entity = data.entity,
                            netId = NetworkGetNetworkIdFromEntity(data.entity),
                            coords = GetEntityCoords(data.entity),
                            distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(data.entity)),
                            model = GetEntityModel(data.entity)
                        }
                        OpenGramophoneMenu(gramophone)
                    end
                }
            })
        elseif targetSystemName == 'rsg-target' then
            exports['rsg-target']:AddTargetModel(model, {
                options = {
                    {
                        type = Config.TargetType,
                        icon = Config.TargetIcon,
                        label = Config.TargetLabel,
                        canInteract = function(entity, distance, data)
                            -- Validate prop before allowing interaction
                            return IsValidGramophoneProp(entity)
                        end,
                        action = function(entity)
                            -- Double-check validation before opening menu
                            if not IsValidGramophoneProp(entity) then
                                Utils.Debug("Invalid prop detected in target interaction - blocked")
                                return
                            end
                            
                            local gramophone = {
                                entity = entity,
                                netId = NetworkGetNetworkIdFromEntity(entity),
                                coords = GetEntityCoords(entity),
                                distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(entity)),
                                model = GetEntityModel(entity)
                            }
                            OpenGramophoneMenu(gramophone)
                        end
                    }
                },
                distance = Config.InteractionDistance
            })
        end
    end
    
    Utils.Debug(string.format(Config.Messages.target_zones_setup, #Config.PhonographModels))
end

-- ════════════════════════════════════════════════════════════════
--  KEYBIND INTERACTION (only if target system is not used)
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    while true do
        Wait(Config.PromptMenuOpenDelay)
        
        -- Only use keybind interaction if target system is not active
        if not targetSystemDetected or not Config.UseTarget then
            local nearestGramophone = GetNearestGramophone()
            
            if nearestGramophone and not isMenuOpen then
                -- Show 3D prompt if enabled and within max distance
                if Config.ShowPrompt3D and nearestGramophone.distance <= Config.Prompt3DMaxDistance then
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
        else
            Wait(Config.TargetActiveDelay) -- If target system is active, check less frequently
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
    
    -- Only show if within max distance
    if dist > Config.Prompt3DMaxDistance then
        return
    end
    
    -- Adjusted scale calculation to make text smaller and more reasonable
    local scale = (1 / dist) * 0.5  -- Reduced from 2 to 0.5
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    -- Cap the maximum scale to prevent text from being too large
    if scale > 1.0 then
        scale = 1.0
    end
    
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
