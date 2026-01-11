--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    ╔═══════════════════════════════════════════════════════════════════════════════════╗
    ║                    COMPREHENSIVE CONFIGURATION FILE                               ║
    ║                   100% Configurable - No Code Editing Required                    ║
    ╚═══════════════════════════════════════════════════════════════════════════════════╝
    
    www.wolves.land | Created by iBoss
    DO NOT RENAME RESOURCE FOLDER - Security Protected
    
    THIS FILE CONTROLS EVERYTHING:
    ✓ Framework integration & detection
    ✓ Interaction methods (keybind, target, 3D text)
    ✓ Audio playback & effects
    ✓ UI/NUI display settings
    ✓ Performance & optimization
    ✓ Economy & permissions
    ✓ Notifications & feedback
    ✓ Server messages & branding
    ✓ Admin commands
    ✓ All hardcoded strings & values
    ✓ All timing intervals
    ✓ All display text
    ✓ All resource names
    ✓ All control codes
    
    NO NEED TO EDIT CLIENT OR SERVER FILES - EVERYTHING IS HERE!
]]

-- SECRET BRAND MARKERS - DO NOT REMOVE
-- TheLandOfWolves | iBoss | www.wolves.land
local PROTECTION_KEY = "TheLandOfWolves_iBoss_WolvesLand_Authentic1899"

Config = {}

-- ═══════════════════════════════════════════════════════════════
--  FRAMEWORK SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.Framework = "auto" -- auto, lxr-core, rsg-core, vorp, qbr, standalone

-- Framework Resource Names (for auto-detection)
Config.FrameworkResources = {
    ['lxr-core'] = 'lxr-core',
    ['rsg-core'] = 'rsg-core',
    ['vorp'] = 'vorp_core',
    ['vorp_alt'] = 'vorp',
    ['qbr'] = 'qbr-core',
    ['redem'] = 'redem',
    ['redem_alt'] = 'redemrp'
}

-- ═══════════════════════════════════════════════════════════════
--  INTERACTION SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.InteractionKey = 'LMENU' -- ALT key (LMENU in RedM)
Config.InteractionDistance = 3.0 -- meters - distance to interact with phonograph

-- Target System Settings
Config.UseTarget = true -- Use ox_target/rsg-target system (auto-detected)
Config.TargetResourceNames = {
    ox_target = 'ox_target',
    rsg_target = 'rsg-target'
}
Config.TargetIcon = 'fas fa-music' -- FontAwesome icon for target system
Config.TargetLabel = 'Use Gramophone' -- Label shown in target system
Config.TargetZoneName = 'twl_gramophone_interact' -- Unique name for target zone
Config.TargetType = 'client' -- Type for rsg-target ('client' or 'server')
Config.TargetLoadWaitTime = 1000 -- milliseconds - wait time for target resources to load

-- 3D Text Prompt Settings
Config.UseThirdEye = false -- Deprecated - use Config.UseTarget instead
Config.ShowPrompt3D = true -- Show 3D prompt above phonograph (only when UseTarget is false or unavailable)
Config.Prompt3DMaxDistance = 2.5 -- Maximum distance to show 3D text (should be less than InteractionDistance)
Config.Prompt3DHeightOffset = 1.0 -- units above gramophone to show 3D text
Config.Prompt3DTextScale = 0.25 -- scale of 3D prompt text
Config.Prompt3DScaleMultiplier = 0.5 -- multiplier for dynamic scaling based on distance
Config.Prompt3DMaxScale = 1.0 -- maximum scale cap to prevent oversized text
Config.Prompt3DText = "Press ~y~[ALT]~w~ to use Gramophone" -- text shown in 3D prompt
Config.Prompt3DTextColor = {r = 255, g = 255, b = 255, a = 215} -- RGBA color for 3D text
Config.Prompt3DDropShadow = {enabled = true, r = 0, g = 0, b = 0, a = 255} -- Drop shadow settings

-- ═══════════════════════════════════════════════════════════════
--  AUDIO SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.DefaultVolume = 0.6 -- 0.0 to 1.0
Config.MaxHearingDistance = 30.0 -- meters - maximum hearing distance
Config.SpatialAudio = true -- Use 3D positional audio
Config.FadeInDuration = 2.0 -- seconds
Config.FadeOutDuration = 1.5 -- seconds
Config.EnableVolumeControl = true -- Allow users to adjust volume

-- Audio System Settings
Config.SoundIdPrefix = "gramophone_" -- Prefix for xsound IDs
Config.UseXSound = true -- Use xsound for audio playback (required)
Config.XSoundResourceName = "xsound" -- xsound resource name

-- ═══════════════════════════════════════════════════════════════
--  PHONOGRAPH PROPS
-- ═══════════════════════════════════════════════════════════════
Config.PhonographModels = {
    `p_phonograph01x`,
    `p_phonograph02x`,
    `p_int_phonograph01`
}

-- ═══════════════════════════════════════════════════════════════
--  PROP VALIDATION SETTINGS (Prevents interaction with polyzones/MLOs)
-- ═══════════════════════════════════════════════════════════════
Config.ValidatePropEntity = true -- Enable comprehensive prop validation (recommended)
Config.ValidateGroundPlacement = true -- Ensure prop is placed on ground (prevents floating MLO issues)
Config.MaxGroundDistance = 5.0 -- Maximum distance from ground in meters (for ground validation)
Config.RequireNetworkId = true -- Require valid network ID for multiplayer sync
Config.AllowAttachedProps = false -- Allow props attached to peds (carried items) - keep false for stationary gramophones
Config.ValidatePhysicalObject = true -- Ensure entity is a physical object (prevents dummy/invisible entities)

-- ═══════════════════════════════════════════════════════════════
--  PLAYLIST SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.EnablePlaylistShuffle = true
Config.AutoPlayNext = true -- Automatically play next track in playlist
Config.ShowNowPlaying = true -- Show "Now Playing" notification
Config.NowPlayingDuration = 5000 -- milliseconds

-- ═══════════════════════════════════════════════════════════════
--  PERMISSION SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.RequireItem = false -- Require item to use phonograph
Config.ItemName = "gramophone_record" -- Item name (if RequireItem = true)
Config.RequireJob = false -- Restrict to specific jobs
Config.AllowedJobs = {"saloonkeeper", "musician", "bartender"}
Config.FreeJobs = {"saloonkeeper", "musician"} -- Jobs that don't pay

-- ═══════════════════════════════════════════════════════════════
--  ECONOMY SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.EnableCost = false -- Charge money per song
Config.CostPerSong = 0.25 -- Cost per song
Config.BusinessIncome = false -- Give income to business owner
Config.BusinessCut = 0.5 -- 50% of cost goes to business owner

-- ═══════════════════════════════════════════════════════════════
--  NOTIFICATIONS & MESSAGES
-- ═══════════════════════════════════════════════════════════════
Config.UseOxLib = true -- Use ox_lib notifications (recommended)

-- Notification Messages
Config.Messages = {
    -- Success Messages
    no_record = "You don't have a gramophone record!",
    not_enough_money = "You don't have enough money! ($%s needed)",
    payment_success = "You paid $%s to play music",
    transaction_failed = "Transaction failed!",
    invalid_track = "Invalid track selection!",
    not_owner = "You don't own this gramophone!",
    stopped_all = "All gramophones stopped",
    config_reload = "Configuration will reload on next use",
    
    -- Admin Messages
    admin_stop_all = "[TWL Gramophone] All gramophones stopped",
    admin_reload = "[TWL Gramophone] Configuration reloaded",
    
    -- Debug Messages
    debug_prefix = "[TWL Gramophone]",
    target_detected_ox = "ox_target detected and will be used",
    target_detected_rsg = "rsg-target detected and will be used",
    target_no_system = "No target system detected, using keybind interaction",
    target_zones_setup = "Target zones setup for %d gramophone models",
    menu_opened = "Opened gramophone menu",
    menu_closed = "Closed gramophone menu",
    track_playing = "Playing: %s by %s",
    gramophone_stopped = "Stopped gramophone %s",
    stopped_all_gramophones = "Stopped all gramophones",
    volume_set = "Set volume to %s for gramophone %s",
    master_volume_set = "Master volume set to %s",
    vintage_effect = "Vintage effect applied to gramophone %s",
    auto_cleanup = "Auto-cleaning up gramophone %s (inactive)",
    resource_stopped = "Resource stopped, cleaned up all sounds",
    
    -- Server Startup Messages
    server_banner_line1 = "═══════════════════════════════════════════════════",
    server_banner_line2 = "║                                                 ║",
    server_banner_line3 = "║    🐺 THE LAND OF WOLVES - GRAMOPHONE 🐺       ║",
    server_banner_line4 = "║         Echoes of 1899 - v1.0.0                ║",
    server_banner_line5 = "║                                                 ║",
    server_banner_line6 = "║         Created by iBoss                        ║",
    server_banner_line7 = "║         www.wolves.land                         ║",
    server_banner_line8 = "║                                                 ║",
    server_banner_line9 = "═══════════════════════════════════════════════════",
    server_info_framework = "[Info] Framework: %s",
    server_info_playlists = "[Info] Playlists loaded: %s",
    server_info_tracks = "[Info] Total tracks: %s",
    server_ready = "[TWL Gramophone] System initialized and ready!",
    
    -- Security Messages
    client_security_failed = "[The Land of Wolves] Client security check failed",
    server_security_failed = "[The Land of Wolves] Security not active - resource compromised",
}

-- Notification Types (for ox_lib or custom notifications)
Config.NotificationTypes = {
    success = 'success',
    error = 'error',
    info = 'info',
    warning = 'warning'
}

-- ═══════════════════════════════════════════════════════════════
--  DEBUG SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.Debug = false -- Enable debug prints

-- ═══════════════════════════════════════════════════════════════
--  PERFORMANCE & OPTIMIZATION SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.PlayerPositionUpdateInterval = 500 -- milliseconds - how often to update player position
Config.GramophoneDetectionInterval = 1000 -- milliseconds - how often to scan for nearby gramophones
Config.AudioPositionUpdateInterval = 1000 -- milliseconds - how often to update audio positions for moving props
Config.InactiveGramophoneCleanup = 60000 -- milliseconds - how often to check for inactive gramophones
Config.SecurityCheckDelay = 2000 -- milliseconds - delay before running security validation
Config.FrameworkInitDelay = 500 -- milliseconds - delay before framework initialization
Config.LateJoinSyncDelay = 5000 -- milliseconds - delay before syncing gramophones for late joiners
Config.SecurityMonitoringInterval = 30000 -- milliseconds - how often to run security checks
Config.ServerStartupDelay = 1000 -- milliseconds - delay before server initialization

-- Thread Delays
Config.PromptMenuOpenDelay = 0 -- milliseconds - main thread delay when checking for menu open
Config.PromptAwayDelay = 500 -- milliseconds - main thread delay when player is away from gramophone
Config.MenuCloseCheckDelay = 0 -- milliseconds - main thread delay when checking for menu close (ESC)
Config.MenuCloseAwayDelay = 500 -- milliseconds - main thread delay when menu is not open
Config.TargetActiveDelay = 1000 -- milliseconds - delay when target system is active (reduces CPU usage)

-- ═══════════════════════════════════════════════════════════════
--  UI & DISPLAY SETTINGS
-- ═══════════════════════════════════════════════════════════════

-- NUI Action Names (for SendNUIMessage)
Config.NUIActions = {
    open_menu = "openMenu",
    close_menu = "closeMenu",
    update_playlists = "updatePlaylists",
    update_config = "updateConfig"
}

-- NUI Callback Names (for RegisterNUICallback)
Config.NUICallbacks = {
    play_track = "playTrack",
    stop_track = "stopTrack",
    close_menu = "closeMenu"
}

-- ═══════════════════════════════════════════════════════════════
--  KEYBIND MAPPING (RedM Control Codes)
-- ═══════════════════════════════════════════════════════════════
Config.KeyMap = {
    ['LMENU'] = 0xD8F73058, -- Left Alt (ALT)
    ['E'] = 0xCEFD9220,
    ['ENTER'] = 0xC7B5340A,
    ['BACKSPACE'] = 0x156F7119,
    ['ESC'] = 0x156F7119
}

-- ═══════════════════════════════════════════════════════════════
--  ADVANCED AUDIO SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.TrackCleanupBuffer = 30 -- seconds - buffer time after track ends before auto-cleanup

-- ═══════════════════════════════════════════════════════════════
--  ADMIN COMMANDS
-- ═══════════════════════════════════════════════════════════════
Config.Commands = {
    stop_all = 'stopallgramophones',
    reload = 'reloadgramophone'
}

Config.CommandRestrictions = {
    require_admin = false, -- Set to true to require admin permissions
    console_only = false -- Set to true to make commands console-only
}

-- ═══════════════════════════════════════════════════════════════
--  EVENT NAMES (Customizable for Anti-Cheat or Obfuscation)
-- ═══════════════════════════════════════════════════════════════
Config.Events = {
    -- Client Events
    client_play_track = 'twl_gramophone:client:playTrack',
    client_stop_track = 'twl_gramophone:client:stopTrack',
    client_stop_all = 'twl_gramophone:client:stopAll',
    client_now_playing = 'twl_gramophone:client:nowPlaying',
    client_sync_data = 'twl_gramophone:client:syncData',
    client_notify = 'twl_gramophone:notify',
    
    -- Server Events
    server_play_track = 'twl_gramophone:server:playTrack',
    server_stop_track = 'twl_gramophone:server:stopTrack',
    server_request_data = 'twl_gramophone:server:requestData',
}
