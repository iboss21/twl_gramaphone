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
    - Phonograph prop models
    - Playlist and playback settings
    - Permission and economy systems
    - Notification preferences
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
