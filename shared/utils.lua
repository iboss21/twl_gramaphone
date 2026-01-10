-- 🐺 Shared Utilities
-- www.wolves.land | Created by iBoss

Utils = {}

-- Print debug messages
function Utils.Debug(message)
    if Config.Debug then
        print("^3[TWL Gramophone]^7 " .. tostring(message))
    end
end

-- Notification helper
function Utils.Notify(source, message, type)
    type = type or 'info'
    
    if IsDuplicityVersion() then
        -- Server-side
        if Config.UseOxLib then
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Gramophone',
                description = message,
                type = type
            })
        else
            TriggerClientEvent('twl_gramaphone:notify', source, message, type)
        end
    else
        -- Client-side
        if Config.UseOxLib then
            lib.notify({
                title = 'Gramophone',
                description = message,
                type = type
            })
        else
            -- Fallback to basic notification
            SetTextScale(0.5, 0.5)
            SetTextColor(255, 255, 255, 255)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(message)
            EndTextCommandDisplayText(0.5, 0.9)
        end
    end
end

-- Check if player has required job
function Utils.HasJob(jobs)
    if not Config.RequireJob then return true end
    if not jobs then return false end
    
    -- This will be implemented per framework
    return false
end

-- Get player money
function Utils.GetMoney(source)
    -- This will be implemented per framework
    return 0
end

-- Remove player money
function Utils.RemoveMoney(source, amount)
    -- This will be implemented per framework
    return false
end

-- Add player money
function Utils.AddMoney(source, amount)
    -- This will be implemented per framework
    return false
end

-- Check if player has item
function Utils.HasItem(source, item)
    if not Config.RequireItem then return true end
    
    -- This will be implemented per framework
    return false
end

-- Get distance between two vectors
function Utils.GetDistance(pos1, pos2)
    return #(vector3(pos1.x, pos1.y, pos1.z) - vector3(pos2.x, pos2.y, pos2.z))
end

-- Round number to decimal places
function Utils.Round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

return Utils
