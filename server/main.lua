-- 🐺 Server Main Logic
-- www.wolves.land | Created by iBoss

local ActiveGramophones = {} -- [netId] = { coords, track, volume, owner, startTime }

-- ════════════════════════════════════════════════════════════════
--  EVENTS
-- ════════════════════════════════════════════════════════════════

-- Request to play a track
RegisterNetEvent('twl_gramaphone:server:playTrack', function(gramophoneNetId, playlistId, trackIndex)
    local src = source
    local player = Framework.GetPlayer(src)
    
    if not player then return end
    
    -- Check permissions
    if not Framework.HasItem(src, Config.ItemName) then
        Utils.Notify(src, "You don't have a gramophone record!", 'error')
        return
    end
    
    -- Check if player needs to pay
    if Config.EnableCost then
        local hasFreeJob = false
        for _, job in ipairs(Config.FreeJobs) do
            if Framework.HasJob(src, {job}) then
                hasFreeJob = true
                break
            end
        end
        
        if not hasFreeJob then
            local money = Framework.GetMoney(src)
            if money < Config.CostPerSong then
                Utils.Notify(src, "You don't have enough money! ($" .. Config.CostPerSong .. " needed)", 'error')
                return
            end
            
            if Framework.RemoveMoney(src, Config.CostPerSong) then
                Utils.Notify(src, "You paid $" .. Config.CostPerSong .. " to play music", 'success')
            else
                Utils.Notify(src, "Transaction failed!", 'error')
                return
            end
        end
    end
    
    -- Find the track
    local playlist = nil
    for _, pl in ipairs(Playlists) do
        if pl.id == playlistId then
            playlist = pl
            break
        end
    end
    
    if not playlist or not playlist.tracks[trackIndex] then
        Utils.Notify(src, "Invalid track selection!", 'error')
        return
    end
    
    local track = playlist.tracks[trackIndex]
    
    -- Store active gramophone data
    ActiveGramophones[gramophoneNetId] = {
        coords = GetEntityCoords(NetworkGetEntityFromNetworkId(gramophoneNetId)),
        playlistId = playlistId,
        trackIndex = trackIndex,
        track = track,
        volume = Config.DefaultVolume,
        owner = src,
        startTime = os.time()
    }
    
    -- Broadcast to all clients
    TriggerClientEvent('twl_gramaphone:client:playTrack', -1, gramophoneNetId, playlistId, trackIndex, track)
    
    Utils.Debug("Playing track: " .. track.title .. " on gramophone " .. gramophoneNetId)
    
    -- Send notification if enabled
    if Config.ShowNowPlaying then
        TriggerClientEvent('twl_gramaphone:client:nowPlaying', -1, gramophoneNetId, track.title, track.artist)
    end
end)

-- Request to stop track
RegisterNetEvent('twl_gramaphone:server:stopTrack', function(gramophoneNetId)
    local src = source
    
    -- Check if player is owner or admin
    if ActiveGramophones[gramophoneNetId] and ActiveGramophones[gramophoneNetId].owner ~= src then
        Utils.Notify(src, "You don't own this gramophone!", 'error')
        return
    end
    
    -- Remove from active list
    ActiveGramophones[gramophoneNetId] = nil
    
    -- Broadcast stop to all clients
    TriggerClientEvent('twl_gramaphone:client:stopTrack', -1, gramophoneNetId)
    
    Utils.Debug("Stopped gramophone " .. gramophoneNetId)
end)

-- Request gramophone data
RegisterNetEvent('twl_gramaphone:server:requestData', function(gramophoneNetId)
    local src = source
    
    if ActiveGramophones[gramophoneNetId] then
        TriggerClientEvent('twl_gramaphone:client:syncData', src, gramophoneNetId, ActiveGramophones[gramophoneNetId])
    end
end)

-- ════════════════════════════════════════════════════════════════
--  COMMANDS
-- ════════════════════════════════════════════════════════════════

-- Admin command to stop all gramophones
RegisterCommand('stopallgramophones', function(source, args, rawCommand)
    if source == 0 then -- Console
        ActiveGramophones = {}
        TriggerClientEvent('twl_gramaphone:client:stopAll', -1)
        print("^2[TWL Gramophone]^7 All gramophones stopped")
    else
        -- Check if player is admin (framework-specific)
        local player = Framework.GetPlayer(source)
        if player then
            ActiveGramophones = {}
            TriggerClientEvent('twl_gramaphone:client:stopAll', -1)
            Utils.Notify(source, "All gramophones stopped", 'success')
        end
    end
end, false)

-- Reload configuration
RegisterCommand('reloadgramophone', function(source, args, rawCommand)
    if source == 0 then -- Console
        print("^2[TWL Gramophone]^7 Configuration reloaded")
    else
        Utils.Notify(source, "Configuration will reload on next use", 'info')
    end
end, false)

-- ════════════════════════════════════════════════════════════════
--  INITIALIZATION
-- ════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(1000)
    print("^2═══════════════════════════════════════════════════^7")
    print("^2║                                                 ║^7")
    print("^2║    🐺 THE LAND OF WOLVES - GRAMOPHONE 🐺       ║^7")
    print("^2║         Echoes of 1899 - v1.0.0                ║^7")
    print("^2║                                                 ║^7")
    print("^2║         Created by iBoss                        ║^7")
    print("^2║         www.wolves.land                         ║^7")
    print("^2║                                                 ║^7")
    print("^2═══════════════════════════════════════════════════^7")
    print("^3[Info]^7 Framework: ^2" .. Framework.Name .. "^7")
    print("^3[Info]^7 Playlists loaded: ^2" .. #Playlists .. "^7")
    
    local totalTracks = 0
    for _, playlist in ipairs(Playlists) do
        totalTracks = totalTracks + #playlist.tracks
    end
    print("^3[Info]^7 Total tracks: ^2" .. totalTracks .. "^7")
    print("^2[TWL Gramophone]^7 System initialized and ready!")
end)

-- Auto-cleanup inactive gramophones
CreateThread(function()
    while true do
        Wait(60000) -- Check every minute
        
        local currentTime = os.time()
        for netId, data in pairs(ActiveGramophones) do
            -- If gramophone has been playing for longer than track duration + 30 seconds, clean it up
            if data.track and data.track.duration then
                local elapsed = currentTime - data.startTime
                if elapsed > (data.track.duration + 30) then
                    Utils.Debug("Auto-cleaning up gramophone " .. netId .. " (inactive)")
                    ActiveGramophones[netId] = nil
                    TriggerClientEvent('twl_gramaphone:client:stopTrack', -1, netId)
                end
            end
        end
    end
end)
