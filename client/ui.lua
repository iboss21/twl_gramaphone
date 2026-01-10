-- 🐺 Client UI Management
-- www.wolves.land | Created by iBoss

-- This file handles UI-related functionality and NUI communication

local uiState = {
    isOpen = false,
    currentGramophone = nil
}

-- ════════════════════════════════════════════════════════════════
--  UI STATE MANAGEMENT
-- ════════════════════════════════════════════════════════════════

function SetUIState(state, gramophone)
    uiState.isOpen = state
    uiState.currentGramophone = gramophone
end

function GetUIState()
    return uiState.isOpen
end

-- ════════════════════════════════════════════════════════════════
--  UI DATA UPDATES
-- ════════════════════════════════════════════════════════════════

function UpdatePlaylistUI()
    SendNUIMessage({
        action = "updatePlaylists",
        playlists = Playlists
    })
end

function UpdateConfigUI()
    SendNUIMessage({
        action = "updateConfig",
        config = {
            volume = Config.DefaultVolume,
            enableCost = Config.EnableCost,
            costPerSong = Config.CostPerSong,
            maxDistance = Config.MaxHearingDistance
        }
    })
end

-- ════════════════════════════════════════════════════════════════
--  EXPORTS
-- ════════════════════════════════════════════════════════════════

exports('GetUIState', GetUIState)
exports('SetUIState', SetUIState)
exports('UpdatePlaylistUI', UpdatePlaylistUI)
exports('UpdateConfigUI', UpdateConfigUI)
