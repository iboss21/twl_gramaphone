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
        Wait(Config.PlayerPositionUpdateInterval)
        playerCoords = GetEntityCoords(PlayerPedId())
    end
end)

-- ════════════════════════════════════════════════════════════════
--  SECURITY CHECK - The Land of Wolves Protection
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(Config.SecurityCheckDelay)
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
        Wait(Config.GramophoneDetectionInterval)
        
        nearbyGramophones = {}
        
        for _, model in ipairs(Config.PhonographModels) do
            local gramophone = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, Config.InteractionDistance, model, false, false, false)
            
            if gramophone ~= 0 then
                -- IMPORTANT: Validate that this is actually a prop entity, not a polyzone or MLO
                if IsValidGramophoneProp(gramophone) then
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
    Wait(Config.LateJoinSyncDelay) -- Wait for player to fully load
    
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

-- ════════════════════════════════════════════════════════════════
--  PROP VALIDATION - Ensures only actual props are interacted with
-- ════════════════════════════════════════════════════════════════

function IsValidGramophoneProp(entity)
    -- Skip validation if disabled in config
    if not Config.ValidatePropEntity then
        return true
    end
    
    -- Validate that the entity is a valid object/prop, not a polyzone or MLO
    
    -- Check 1: Entity must exist
    if not DoesEntityExist(entity) then
        if Config.Debug then Utils.Debug("Entity doesn't exist - rejected") end
        return false
    end
    
    -- Check 2: Must be an object type (not ped, vehicle, etc.)
    local entityType = GetEntityType(entity)
    if entityType ~= 3 then -- Type 3 = Object
        if Config.Debug then Utils.Debug("Entity is not an object (type: " .. entityType .. ") - rejected") end
        return false
    end
    
    -- Check 3: Must be a physical entity (not a dummy or invisible entity)
    if Config.ValidatePhysicalObject and not IsEntityAPhysicalObject(entity) then
        if Config.Debug then Utils.Debug("Entity is not a physical object - rejected") end
        return false
    end
    
    -- Check 4: Validate model hash matches our expected gramophone models
    local model = GetEntityModel(entity)
    local isValidModel = false
    for _, configModel in ipairs(Config.PhonographModels) do
        if model == configModel then
            isValidModel = true
            break
        end
    end
    
    if not isValidModel then
        if Config.Debug then Utils.Debug("Entity model doesn't match configured models - rejected") end
        return false
    end
    
    -- Check 5: Entity must not be attached to a ped (carried item) unless allowed
    if not Config.AllowAttachedProps and IsEntityAttachedToAnyPed(entity) then
        if Config.Debug then Utils.Debug("Entity is attached to a ped - rejected") end
        return false
    end
    
    -- Check 6: Entity should have valid coordinates (not 0,0,0 which could indicate MLO issues)
    local coords = GetEntityCoords(entity)
    if coords.x == 0.0 and coords.y == 0.0 and coords.z == 0.0 then
        if Config.Debug then Utils.Debug("Entity has invalid coordinates (0,0,0) - rejected") end
        return false
    end
    
    -- Check 7: Ensure entity is on the ground or placed (not floating in void)
    if Config.ValidateGroundPlacement then
        local groundZ = 0.0
        local foundGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 5.0, groundZ, false)
        if foundGround and math.abs(coords.z - groundZ) > Config.MaxGroundDistance then
            if Config.Debug then Utils.Debug("Entity is too far from ground - possible MLO issue - rejected") end
            return false
        end
    end
    
    -- Check 8: Network ID validation (for multiplayer sync)
    if Config.RequireNetworkId then
        local netId = NetworkGetNetworkIdFromEntity(entity)
        if netId == 0 or netId == nil then
            if Config.Debug then Utils.Debug("Entity has invalid network ID - rejected") end
            return false
        end
    end
    
    -- All checks passed - this is a valid gramophone prop
    if Config.Debug then Utils.Debug("Entity validated as proper gramophone prop") end
    return true
end

exports('GetNearestGramophone', GetNearestGramophone)
exports('IsGramophonePlaying', function(netId)
    return activeGramophones[netId] ~= nil
end)
