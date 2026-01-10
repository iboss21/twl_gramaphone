--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
    
    CONFIGURATION FILE
    www.wolves.land | Created by iBoss
    DO NOT RENAME RESOURCE FOLDER - Security Protected
    
    This file contains all configurable settings:
    - Framework selection and detection
    - Interaction settings (keybind, distance, prompts)
    - Audio settings (volume, distance, spatial audio)
    - Performance optimization timings (update intervals)
    - UI & display settings (3D text, prompts)
    - Keybind mapping (RedM control codes)
    - Phonograph prop models
    - Playlist and playback settings
    - Permission and economy systems
    - Notification preferences
    - Debug settings
    
    Everything is now configurable - no need to edit client/server files!
]]

-- SECRET BRAND MARKERS - DO NOT REMOVE
-- TheLandOfWolves | iBoss | www.wolves.land
local PROTECTION_KEY = "TheLandOfWolves_iBoss_WolvesLand_Authentic1899"

Config = {}

-- ═══════════════════════════════════════════════════════════════
--  FRAMEWORK SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.Framework = "auto" -- auto, lxr-core, rsg-core, vorp, qbr, standalone

-- ═══════════════════════════════════════════════════════════════
--  INTERACTION SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.InteractionKey = 'LMENU' -- ALT key (LMENU in RedM)
Config.InteractionDistance = 3.0 -- meters - distance to interact with phonograph
Config.UseThirdEye = false -- Use third-eye/target system (if available)
Config.ShowPrompt3D = true -- Show 3D prompt above phonograph

-- ═══════════════════════════════════════════════════════════════
--  AUDIO SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.DefaultVolume = 0.6 -- 0.0 to 1.0
Config.MaxHearingDistance = 30.0 -- meters - maximum hearing distance
Config.SpatialAudio = true -- Use 3D positional audio
Config.FadeInDuration = 2.0 -- seconds
Config.FadeOutDuration = 1.5 -- seconds
Config.EnableVolumeControl = true -- Allow users to adjust volume

-- ═══════════════════════════════════════════════════════════════
--  PHONOGRAPH PROPS
-- ═══════════════════════════════════════════════════════════════
Config.PhonographModels = {
    `p_phonograph01x`,
    `p_phonograph02x`,
    `p_int_phonograph01`
}

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
--  NOTIFICATIONS
-- ═══════════════════════════════════════════════════════════════
Config.UseOxLib = true -- Use ox_lib notifications (recommended)

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

-- ═══════════════════════════════════════════════════════════════
--  UI & DISPLAY SETTINGS
-- ═══════════════════════════════════════════════════════════════
Config.Prompt3DHeightOffset = 1.0 -- units above gramophone to show 3D text
Config.Prompt3DTextScale = 0.35 -- scale of 3D prompt text
Config.Prompt3DText = "Press ~y~[ALT]~w~ to use Gramophone" -- text shown in 3D prompt
Config.PromptMenuOpenDelay = 0 -- milliseconds - main thread delay when checking for menu open
Config.PromptAwayDelay = 500 -- milliseconds - main thread delay when player is away from gramophone
Config.MenuCloseCheckDelay = 0 -- milliseconds - main thread delay when checking for menu close (ESC)
Config.MenuCloseAwayDelay = 500 -- milliseconds - main thread delay when menu is not open

-- ═══════════════════════════════════════════════════════════════
--  KEYBIND MAPPING
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
