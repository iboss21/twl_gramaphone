-- 🐺 Client Audio Management
-- www.wolves.land | Created by iBoss

-- This file handles advanced audio features like volume control,
-- positional audio updates, and audio effects

local audioSettings = {
    masterVolume = Config.DefaultVolume,
    spatialAudio = Config.SpatialAudio,
    maxDistance = Config.MaxHearingDistance
}

-- ════════════════════════════════════════════════════════════════
--  VOLUME CONTROL
-- ════════════════════════════════════════════════════════════════

function SetGramophoneVolume(gramophoneNetId, volume)
    local soundId = activeGramophones[gramophoneNetId]
    if soundId then
        exports.xsound:setVolume(soundId, volume)
        Utils.Debug("Set volume to " .. volume .. " for gramophone " .. gramophoneNetId)
    end
end

function AdjustMasterVolume(volume)
    audioSettings.masterVolume = math.max(0.0, math.min(1.0, volume))
    
    -- Update all active gramophones
    for netId, soundId in pairs(activeGramophones) do
        exports.xsound:setVolume(soundId, audioSettings.masterVolume)
    end
    
    Utils.Debug("Master volume set to " .. audioSettings.masterVolume)
end

-- ════════════════════════════════════════════════════════════════
--  POSITIONAL AUDIO UPDATES
-- ════════════════════════════════════════════════════════════════

-- Update audio positions for moving gramophones (if prop is moved)
CreateThread(function()
    while true do
        Wait(1000)
        
        for netId, soundId in pairs(activeGramophones) do
            local entity = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(entity) then
                local coords = GetEntityCoords(entity)
                exports.xsound:Position(soundId, coords)
            end
        end
    end
end)

-- ════════════════════════════════════════════════════════════════
--  AUDIO EFFECTS (Future Enhancement)
-- ════════════════════════════════════════════════════════════════

function ApplyVintageEffect(gramophoneNetId)
    -- Future: Apply vintage phonograph audio effects
    -- This could include crackle, hiss, reduced frequency range, etc.
    Utils.Debug("Vintage effect applied to gramophone " .. gramophoneNetId)
end

-- ════════════════════════════════════════════════════════════════
--  EXPORTS
-- ════════════════════════════════════════════════════════════════

exports('SetGramophoneVolume', SetGramophoneVolume)
exports('AdjustMasterVolume', AdjustMasterVolume)
exports('GetMasterVolume', function()
    return audioSettings.masterVolume
end)
