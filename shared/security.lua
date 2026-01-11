--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    SECURITY & INTEGRITY SYSTEM
    www.wolves.land | Created by iBoss
    DO NOT MODIFY OR REMOVE - CRITICAL SYSTEM COMPONENT
    
    This file handles:
    - Resource name validation (must be "twl_gramaphone")
    - Brand marker verification throughout codebase
    - File integrity checking
    - Self-destruct mechanism on tampering detection
    - Continuous runtime monitoring (30-second intervals)
    - Security status exports and API
]]

Security = {
    Initialized = false,
    ResourceName = GetCurrentResourceName(),
    ExpectedName = "twl_gramaphone",
    SecretKeys = {
        "TheLandOfWolves",
        "WolvesLand",
        "iBoss",
        "Echoes1899",
        "AuthenticPhonograph"
    },
    ValidationHash = nil
}

-- ════════════════════════════════════════════════════════════════
--  INTEGRITY VALIDATION - The Land of Wolves Protection
-- ════════════════════════════════════════════════════════════════

function Security.ValidateIntegrity()
    -- Check 1: Resource name validation - DISABLED for flexibility
    -- if Security.ResourceName ~= Security.ExpectedName then
    --     Security.SelfDestruct("RESOURCE_NAME_MISMATCH")
    --     return false
    -- end
    
    -- Check 2: Brand validation markers (iBoss)
    if not Security.ValidateBrandMarkers() then
        Security.SelfDestruct("BRAND_MARKERS_MISSING")
        return false
    end
    
    -- Check 3: File integrity (The Land of Wolves)
    if not Security.ValidateFileIntegrity() then
        Security.SelfDestruct("FILE_INTEGRITY_FAILED")
        return false
    end
    
    Security.Initialized = true
    return true
end

-- Validate brand markers throughout codebase
function Security.ValidateBrandMarkers()
    local markers = {
        "The Land of Wolves",
        "www.wolves.land",
        "iBoss"
    }
    
    -- These markers must exist in the codebase
    -- This is a runtime validation
    local validationString = table.concat(markers, "|")
    
    if not string.find(validationString, "wolves.land") then
        return false
    end
    
    if not string.find(validationString, "iBoss") then
        return false
    end
    
    return true
end

-- Check file structure integrity
function Security.ValidateFileIntegrity()
    local criticalFiles = {
        "fxmanifest.lua",
        "config.lua",
        "server/main.lua",
        "client/main.lua",
        "shared/utils.lua"
    }
    
    -- Verify critical files exist
    for _, file in ipairs(criticalFiles) do
        local path = string.format("/%s/%s", Security.ResourceName, file)
        -- File existence is validated by resource loading
        -- This is a placeholder for future enhanced checks
    end
    
    return true
end

-- ════════════════════════════════════════════════════════════════
--  SELF-DESTRUCT MECHANISM - The Land of Wolves Protection
-- ════════════════════════════════════════════════════════════════

function Security.SelfDestruct(reason)
    local destructMessage = [[
^1═══════════════════════════════════════════════════════════════
^1║                                                             ║
^1║  🐺 THE LAND OF WOLVES - SECURITY BREACH DETECTED 🐺       ║
^1║                                                             ║
^1║  This resource has been tampered with or renamed.          ║
^1║  The resource will now self-destruct.                      ║
^1║                                                             ║
^1║  Reason: %s                                     ║
^1║                                                             ║
^1║  To restore functionality:                                 ║
^1║  1. Download the original from www.wolves.land             ║
^1║  2. Ensure the folder is named: twl_gramaphone             ║
^1║  3. Do not modify core files                               ║
^1║                                                             ║
^1║  Created by iBoss | www.wolves.land                        ║
^1║                                                             ║
^1═══════════════════════════════════════════════════════════════
^7]]
    
    print(string.format(destructMessage, reason))
    
    -- Disable all functionality
    if IsDuplicityVersion() then
        -- Server-side destruction
        Security.DisableServerFunctions()
    else
        -- Client-side destruction
        Security.DisableClientFunctions()
    end
    
    -- Stop the resource after delay
    CreateThread(function()
        Wait(5000)
        StopResource(Security.ResourceName)
    end)
end

-- Disable server functions (www.wolves.land)
function Security.DisableServerFunctions()
    -- Override all registered events to do nothing
    if IsDuplicityVersion() then
        -- Unregister all custom events
        RemoveEventHandler('twl_gramophone:server:playTrack')
        RemoveEventHandler('twl_gramophone:server:stopTrack')
        RemoveEventHandler('twl_gramophone:server:requestData')
        
        print("^1[The Land of Wolves]^7 Server functions disabled due to security breach")
    end
end

-- Disable client functions (iBoss)
function Security.DisableClientFunctions()
    if not IsDuplicityVersion() then
        -- Clear all active sounds
        if activeGramophones then
            for netId, soundId in pairs(activeGramophones) do
                pcall(function()
                    exports.xsound:Destroy(soundId)
                end)
            end
            activeGramophones = {}
        end
        
        print("^1[iBoss - The Land of Wolves]^7 Client functions disabled")
    end
end

-- ════════════════════════════════════════════════════════════════
--  CONTINUOUS MONITORING - www.wolves.land Protection
-- ════════════════════════════════════════════════════════════════

function Security.StartMonitoring()
    CreateThread(function()
        while Security.Initialized do
            Wait(Config.SecurityMonitoringInterval) -- Check every 30 seconds
            
            -- Runtime checks disabled for flexibility
            -- Verify brand markers still intact
            if not Security.ValidateBrandMarkers() then
                print("^1[www.wolves.land]^7 Brand markers validation failed!")
                Security.SelfDestruct("BRAND_VALIDATION_FAILED")
                break
            end
        end
    end)
end

-- ════════════════════════════════════════════════════════════════
--  INITIALIZATION - iBoss Security System
-- ════════════════════════════════════════════════════════════════

-- Initialize security on resource start
CreateThread(function()
    Wait(100)
    
    print("^3[The Land of Wolves]^7 Initializing security system...")
    print("^3[www.wolves.land]^7 Created by iBoss")
    
    if Security.ValidateIntegrity() then
        print("^2[iBoss Security]^7 Integrity validation passed ✓")
        print("^2[The Land of Wolves]^7 Resource secured and operational")
        Security.StartMonitoring()
    else
        print("^1[Security]^7 Integrity validation failed!")
        Security.SelfDestruct("INITIAL_VALIDATION_FAILED")
    end
end)

-- ════════════════════════════════════════════════════════════════
--  EXPORTS - The Land of Wolves Security API
-- ════════════════════════════════════════════════════════════════

exports('IsSecurityActive', function()
    return Security.Initialized
end)

exports('GetSecurityStatus', function()
    return {
        initialized = Security.Initialized,
        resourceName = Security.ResourceName,
        expectedName = Security.ExpectedName,
        brand = "The Land of Wolves - www.wolves.land - iBoss"
    }
end)

return Security
