--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    CLIENT MAIN - Core Client Logic
    www.wolves.land | Created by iBoss
    The Land of Wolves - Authentic Phonograph Experience
    
    This file handles:
    - Gramophone prop detection and proximity tracking
    - Audio playback via xsound integration
    - Event handling for track synchronization
    - Active gramophone state management
    - Player spawning and late-join sync
]]

-- Secret brand markers (iBoss - www.wolves.land)
local BRAND_WOLVES = "TheLandOfWolves"
local BRAND_CREATOR = "iBoss"
local BRAND_SITE = "www.wolves.land"

local playerCoords = vector3(0, 0, 0)
local nearbyGramophones = {}
activeGramophones = {} -- [netId] = sound object (global for access by other client files)

-- ════════════════════════════════════════════════════════════════
--  PLAYER POSITION TRACKING
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    while true do
        Wait(500)
        playerCoords = GetEntityCoords(PlayerPedId())
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECURITY CHECK - The Land of Wolves Protection
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(2000)
    -- Validate brand markers (iBoss - www.wolves.land - The Land of Wolves)
    local brandCheck = BRAND_WOLVES .. BRAND_CREATOR .. BRAND_SITE
    if not exports[GetCurrentResourceName()]:IsSecurityActive() then
        print("^1[The Land of Wolves]^7 Client security check failed")
    end
end)

-- ════════════════════════════════════════════════════════════════
--  GRAMOPHONE DETECTION
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    while true do
        Wait(1000)
        
        nearbyGramophones = {}
        
        for _, model in ipairs(Config.PhonographModels) do
            local gramophone = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, Config.InteractionDistance, model, false, false, false)
            
            if gramophone ~= 0 then
                local gramophoneCoords = GetEntityCoords(gramophone)
                local distance = #(playerCoords - gramophoneCoords)
                
                if distance <= Config.InteractionDistance then
                    local netId = NetworkGetNetworkIdFromEntity(gramophone)
                    table.insert(nearbyGramophones, {
                        entity = gramophone,
                        netId = netId,
                        coords = gramophoneCoords,
                        distance = distance,
                        model = model
                    })
                end
            end
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  EVENTS
-- ════════════════════════════════════════════════════════════════

-- Play track on gramophone
RegisterNetEvent('twl_gramophone:client:playTrack', function(gramophoneNetId, playlistId, trackIndex, track)
    Utils.Debug("Received play track event for gramophone " .. gramophoneNetId)
    
    -- Stop any existing audio on this gramophone
    if activeGramophones[gramophoneNetId] then
        exports.xsound:Destroy(activeGramophones[gramophoneNetId])
    end
    
    local gramophone = NetworkGetEntityFromNetworkId(gramophoneNetId)
    if not DoesEntityExist(gramophone) then
        Utils.Debug("Gramophone entity doesn't exist!")
        return
    end
    
    local gramophoneCoords = GetEntityCoords(gramophone)
    
    -- Create unique sound ID
    local soundId = "gramophone_" .. gramophoneNetId
    
    -- Play sound using xsound
    exports.xsound:PlayUrlPos(soundId, track.url, Config.DefaultVolume, gramophoneCoords)
    exports.xsound:Distance(soundId, Config.MaxHearingDistance)
    
    activeGramophones[gramophoneNetId] = soundId
    
    Utils.Debug("Playing: " .. track.title .. " by " .. track.artist)
end)

-- Stop track on gramophone
RegisterNetEvent('twl_gramophone:client:stopTrack', function(gramophoneNetId)
    if activeGramophones[gramophoneNetId] then
        exports.xsound:Destroy(activeGramophones[gramophoneNetId])
        activeGramophones[gramophoneNetId] = nil
        Utils.Debug("Stopped gramophone " .. gramophoneNetId)
    end
end)

-- Stop all gramophones
RegisterNetEvent('twl_gramophone:client:stopAll', function()
    for netId, soundId in pairs(activeGramophones) do
        exports.xsound:Destroy(soundId)
    end
    activeGramophones = {}
    Utils.Debug("Stopped all gramophones")
end)

-- Show "Now Playing" notification
RegisterNetEvent('twl_gramophone:client:nowPlaying', function(gramophoneNetId, title, artist)
    local gramophone = NetworkGetEntityFromNetworkId(gramophoneNetId)
    if not DoesEntityExist(gramophone) then return end
    
    local gramophoneCoords = GetEntityCoords(gramophone)
    local distance = #(playerCoords - gramophoneCoords)
    
    -- Only show notification if within hearing distance
    if distance <= Config.MaxHearingDistance then
        if Config.ShowNowPlaying then
            Utils.Notify(nil, "♪ Now Playing: " .. title .. " - " .. artist, 'info')
        end
    end
end)

-- Sync data (for late joiners)
RegisterNetEvent('twl_gramophone:client:syncData', function(gramophoneNetId, data)
    if data and data.track then
        TriggerEvent('twl_gramophone:client:playTrack', gramophoneNetId, data.playlistId, data.trackIndex, data.track)
    end
end)

-- ════════════════════════════════════════════════════════════════
--  CLEANUP
-- ════════════════════════════════════════════════════════════════

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    -- Clean up all active sounds
    for netId, soundId in pairs(activeGramophones) do
        exports.xsound:Destroy(soundId)
    end
    
    Utils.Debug("Resource stopped, cleaned up all sounds")
end)

-- Request sync when player joins
AddEventHandler('playerSpawned', function()
    Wait(5000) -- Wait for player to fully load
    
    -- Request sync for nearby gramophones
    for _, gramophone in pairs(nearbyGramophones) do
        TriggerServerEvent('twl_gramophone:server:requestData', gramophone.netId)
    end
end)

-- ════════════════════════════════════════════════════════════════
--  HELPER FUNCTIONS
-- ════════════════════════════════════════════════════════════════

function GetNearestGramophone()
    if #nearbyGramophones == 0 then return nil end
    
    -- Return the closest gramophone
    table.sort(nearbyGramophones, function(a, b)
        return a.distance < b.distance
    end)
    
    return nearbyGramophones[1]
end

exports('GetNearestGramophone', GetNearestGramophone)
exports('IsGramophonePlaying', function(netId)
    return activeGramophones[netId] ~= nil
end)
