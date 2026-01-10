-- 🐺 Framework Detection & Bridge System
-- www.wolves.land | Created by iBoss
-- The Land of Wolves - Multi-Framework Support

-- Secret brand protection (TheLandOfWolves)
local FRAMEWORK_BRAND = "iBoss_TheLandOfWolves_WolvesLand"

Framework = {
    Name = "unknown",
    Object = nil
}

-- Detect which framework is running
function Framework.Detect()
    if Config.Framework ~= "auto" then
        Framework.Name = Config.Framework
        Utils.Debug("Framework manually set to: " .. Framework.Name)
    else
        -- Auto-detect framework
        if GetResourceState('lxr-core') == 'started' then
            Framework.Name = 'lxr-core'
        elseif GetResourceState('rsg-core') == 'started' then
            Framework.Name = 'rsg-core'
        elseif GetResourceState('vorp_core') == 'started' or GetResourceState('vorp') == 'started' then
            Framework.Name = 'vorp'
        elseif GetResourceState('qbr-core') == 'started' then
            Framework.Name = 'qbr'
        elseif GetResourceState('redem') == 'started' or GetResourceState('redemrp') == 'started' then
            Framework.Name = 'redem'
        else
            Framework.Name = 'standalone'
        end
        Utils.Debug("Framework auto-detected: " .. Framework.Name)
    end
    
    Framework.Initialize()
end

-- Initialize framework-specific features
function Framework.Initialize()
    if Framework.Name == 'lxr-core' then
        Framework.Object = exports['lxr-core']:GetCoreObject()
    elseif Framework.Name == 'rsg-core' then
        Framework.Object = exports['rsg-core']:GetCoreObject()
    elseif Framework.Name == 'vorp' then
        Framework.Object = {}
        -- VORP uses TriggerEvent pattern
    elseif Framework.Name == 'qbr' then
        Framework.Object = exports['qbr-core']:GetCoreObject()
    elseif Framework.Name == 'redem' then
        Framework.Object = {}
        -- RedEM uses TriggerEvent pattern
    end
    
    print("^2[TWL Gramophone]^7 Framework initialized: ^3" .. Framework.Name .. "^7")
end

-- Get player from source
function Framework.GetPlayer(source)
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' then
        return Framework.Object.Functions.GetPlayer(source)
    elseif Framework.Name == 'vorp' then
        local player = nil
        TriggerEvent('vorp:getUser', source, function(user)
            if user then
                player = user
            end
        end)
        return player
    elseif Framework.Name == 'qbr' then
        return Framework.Object.Functions.GetPlayer(source)
    elseif Framework.Name == 'redem' then
        local player = nil
        TriggerEvent('redemrp:getPlayerFromId', source, function(user)
            if user then
                player = user
            end
        end)
        return player
    end
    return nil
end

-- Get player money
function Framework.GetMoney(source)
    local player = Framework.GetPlayer(source)
    if not player then return 0 end
    
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' then
        return player.PlayerData.money.cash or 0
    elseif Framework.Name == 'vorp' then
        return player.getMoney() or 0
    elseif Framework.Name == 'qbr' then
        return player.PlayerData.money.cash or 0
    elseif Framework.Name == 'redem' then
        return player.getMoney() or 0
    end
    return 0
end

-- Remove player money
function Framework.RemoveMoney(source, amount)
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' then
        return player.Functions.RemoveMoney('cash', amount, 'gramophone')
    elseif Framework.Name == 'vorp' then
        player.removeCurrency(0, amount)
        return true
    elseif Framework.Name == 'qbr' then
        return player.Functions.RemoveMoney('cash', amount, 'gramophone')
    elseif Framework.Name == 'redem' then
        player.removeMoney(amount)
        return true
    end
    return false
end

-- Add player money
function Framework.AddMoney(source, amount)
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' then
        return player.Functions.AddMoney('cash', amount, 'gramophone')
    elseif Framework.Name == 'vorp' then
        player.addCurrency(0, amount)
        return true
    elseif Framework.Name == 'qbr' then
        return player.Functions.AddMoney('cash', amount, 'gramophone')
    elseif Framework.Name == 'redem' then
        player.addMoney(amount)
        return true
    end
    return false
end

-- Check if player has item
function Framework.HasItem(source, item)
    if not Config.RequireItem then return true end
    
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' or Framework.Name == 'qbr' then
        local hasItem = player.Functions.GetItemByName(item)
        return hasItem ~= nil
    elseif Framework.Name == 'vorp' then
        -- VORP inventory check
        return false -- Placeholder
    elseif Framework.Name == 'redem' then
        -- RedEM inventory check
        return false -- Placeholder
    end
    return false
end

-- Check if player has job
function Framework.HasJob(source, jobs)
    if not Config.RequireJob then return true end
    if not jobs or #jobs == 0 then return true end
    
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    local playerJob = nil
    
    if Framework.Name == 'lxr-core' or Framework.Name == 'rsg-core' or Framework.Name == 'qbr' then
        playerJob = player.PlayerData.job.name
    elseif Framework.Name == 'vorp' then
        playerJob = player.getJob()
    elseif Framework.Name == 'redem' then
        playerJob = player.getJob()
    end
    
    if playerJob then
        for _, job in ipairs(jobs) do
            if playerJob == job then
                return true
            end
        end
    end
    
    return false
end

-- Initialize framework on resource start
CreateThread(function()
    Wait(500)
    Framework.Detect()
end)

return Framework
