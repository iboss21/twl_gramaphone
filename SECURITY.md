# 🐺 Security & Anti-Tampering System
## The Land of Wolves - Gramophone Protection

**Created by iBoss | www.wolves.land**

---

## Overview

The TWL Gramophone resource includes a comprehensive anti-tampering and brand protection system to ensure the integrity of the code and proper attribution to The Land of Wolves brand.

## Security Features

### 1. Resource Name Validation

The resource **MUST** be named exactly: `twl_gramaphone`

- Validates on startup
- Continuous monitoring every 30 seconds
- Triggers self-destruct if renamed

### 2. Brand Protection Markers

Secret markers embedded throughout the codebase:

**Primary Markers:**
- `TheLandOfWolves` - Brand identifier
- `iBoss` - Creator identifier  
- `www.wolves.land` - Website identifier
- `Authentic1899` - Project authenticity marker
- `Echoes1899` - Version marker

**Total Occurrences:** 64+ brand markers across all files

### 3. Self-Destruct Mechanism

If tampering is detected, the resource will:

1. Display a warning message in console
2. Disable all server functions
3. Disable all client functions  
4. Stop all active audio
5. Stop the resource after 5 seconds

**Triggers:**
- Resource folder renamed
- Brand markers removed
- Critical files missing
- Runtime name changes

### 4. Continuous Monitoring

A background thread runs every 30 seconds checking:
- Resource name integrity
- Brand marker validation
- File structure integrity

## Protected Files

All files contain brand protection markers:

**Server:**
- `server/main.lua` - Core server logic
- `server/framework.lua` - Framework detection

**Client:**
- `client/main.lua` - Core client logic
- `client/interaction.lua` - User interaction
- `client/audio.lua` - Audio management
- `client/ui.lua` - UI management

**Shared:**
- `shared/security.lua` - Security system (NEW)
- `shared/utils.lua` - Utility functions
- `shared/playlists.lua` - Music playlists

**Configuration:**
- `config.lua` - Main configuration
- `fxmanifest.lua` - Resource manifest

**UI:**
- `html/index.html` - HTML structure
- `html/script.js` - JavaScript logic
- `html/style.css` - CSS styling

**Localization:**
- `locales/en.lua` - English language

## Security API Exports

### `IsSecurityActive()`
Returns: `boolean`

Check if security system is active and validated.

```lua
local isSecure = exports['twl_gramaphone']:IsSecurityActive()
```

### `GetSecurityStatus()`
Returns: `table`

Get detailed security status information.

```lua
local status = exports['twl_gramaphone']:GetSecurityStatus()
-- Returns:
-- {
--     initialized = true/false,
--     resourceName = "current_name",
--     expectedName = "twl_gramaphone",
--     brand = "The Land of Wolves - www.wolves.land - iBoss"
-- }
```

## Warning Messages

If tampering is detected, you will see:

```
═══════════════════════════════════════════════════════════════
║                                                             ║
║  🐺 THE LAND OF WOLVES - SECURITY BREACH DETECTED 🐺       ║
║                                                             ║
║  This resource has been tampered with or renamed.          ║
║  The resource will now self-destruct.                      ║
║                                                             ║
║  Reason: [SPECIFIC_REASON]                                 ║
║                                                             ║
║  To restore functionality:                                 ║
║  1. Download the original from www.wolves.land             ║
║  2. Ensure the folder is named: twl_gramaphone             ║
║  3. Do not modify core files                               ║
║                                                             ║
║  Created by iBoss | www.wolves.land                        ║
║                                                             ║
═══════════════════════════════════════════════════════════════
```

## Breach Reasons

- `RESOURCE_NAME_MISMATCH` - Folder renamed from twl_gramaphone
- `BRAND_MARKERS_MISSING` - Brand protection markers removed
- `FILE_INTEGRITY_FAILED` - Critical files missing or corrupted
- `RUNTIME_NAME_CHANGE` - Name changed during runtime
- `BRAND_VALIDATION_FAILED` - Brand validation checks failed
- `INITIAL_VALIDATION_FAILED` - Failed startup validation

## Legal & Licensing

This security system protects:

**Copyright:** © 2026 iBoss | The Land of Wolves  
**License:** MIT License with attribution requirement  
**Brand:** The Land of Wolves  
**Website:** www.wolves.land  
**Creator:** iBoss

### Attribution Requirements

When using this resource:
1. Keep the resource folder named `twl_gramaphone`
2. Do not remove brand markers from code
3. Do not remove credits from documentation
4. Maintain "Created by iBoss | www.wolves.land" in headers

### Modifications

You may:
- ✅ Edit `config.lua` settings
- ✅ Add new playlists to `shared/playlists.lua`
- ✅ Modify UI styling in `html/style.css`
- ✅ Add translations to `locales/`

You must NOT:
- ❌ Rename the resource folder
- ❌ Remove brand markers from code
- ❌ Remove security system (`shared/security.lua`)
- ❌ Remove creator attribution

## Restoring After Breach

If the security system triggered:

1. **Stop the resource:** `stop twl_gramaphone`
2. **Delete the folder** from resources
3. **Download fresh copy** from www.wolves.land or GitHub
4. **Ensure correct name:** `twl_gramaphone`
5. **Restart the resource:** `ensure twl_gramaphone`

## Support

**Issues with security system:**
- Check resource folder name is exactly `twl_gramaphone`
- Verify no core files were modified
- Check console for specific breach reason
- Contact support at www.wolves.land

**False positives:**
If you believe you received a false security breach warning, contact us:
- Discord: discord.gg/landofwolves
- Website: www.wolves.land
- GitHub: github.com/iboss21/twl_gramaphone/issues

---

## Technical Implementation

### Validation Flow

```
Resource Start
    ↓
Security.lua Loads
    ↓
Validate Resource Name
    ↓
Validate Brand Markers
    ↓
Validate File Integrity
    ↓
[PASS] Start Monitoring Thread ←→ [FAIL] Self-Destruct
    ↓
Check Every 30 Seconds
    ↓
[BREACH DETECTED] → Self-Destruct
```

### Monitoring Thread

```lua
CreateThread(function()
    while Security.Initialized do
        Wait(30000) -- 30 seconds
        
        -- Check resource name
        if GetCurrentResourceName() ~= "twl_gramaphone" then
            Security.SelfDestruct("RUNTIME_NAME_CHANGE")
        end
        
        -- Check brand markers
        if not Security.ValidateBrandMarkers() then
            Security.SelfDestruct("BRAND_VALIDATION_FAILED")
        end
    end
end)
```

---

## Statistics

**Security Metrics:**
- Brand Markers: 64+ occurrences
- Protected Files: 15 files
- Validation Checks: 3 types
- Monitoring Frequency: Every 30 seconds
- Protected Keywords: 10+ secret markers

**Coverage:**
- Server Code: 100% protected
- Client Code: 100% protected
- UI Code: 100% protected
- Configuration: 100% protected

---

<div align="center">

## 🐺 The Land of Wolves

**Immersion Through Excellence**

*Security System v1.0*

Created with ❤️ by **iBoss**  
**www.wolves.land**

---

*© 2026 The Land of Wolves | MIT License | All Rights Reserved*

</div>
