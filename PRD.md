# Product Requirements Document (PRD)
# The Land of Wolves - Immersive Phonograph System
## "Echoes of 1899" - Authentic Period Music Experience

**Brand:** The Land of Wolves (www.wolves.land)  
**Author:** iBoss  
**Version:** 2.0 (Enhanced Edition)  
**Date:** January 10, 2026  
**Project:** twl_gramaphone  
**Target Platform:** RedM (Red Dead Redemption 2 Multiplayer)  
**License:** MIT Open Source

---

## 🐺 About The Land of Wolves

The Land of Wolves (wolves.land) is dedicated to creating immersive, historically-accurate, and technically-superior roleplay resources for the RedM community. Our mission is to enhance the Wild West experience with attention to detail, performance, and cross-framework compatibility.

**Our Values:**
- 🎯 **Historical Accuracy** - Period-appropriate content that respects the 1899 era
- 🔧 **Technical Excellence** - Clean code, optimized performance, extensive testing
- 🤝 **Community First** - Open source, well-documented, and widely compatible
- 🎨 **Immersive Design** - Every detail matters for roleplay atmosphere

---

## 1. Executive Summary

This document outlines the requirements for a gramophone/phonograph script for RedM that allows players to interact with period-appropriate music playback devices. The script will support multiple RedM frameworks (lxr-core, rsg-core, VORP, and others) and provide an immersive 1899-era music experience.

---

## 2. Problem Statement

**Current Gap:**
- Limited immersive audio experiences in RedM servers
- No unified gramophone system that works across different frameworks
- Lack of period-appropriate music integration for saloons, homes, and events

**Proposed Solution:**
A framework-agnostic gramophone script that allows players to:
- Press a keybind (ALT) to interact with gramophone props
- Select from curated playlists of 1899-era appropriate music
- Enjoy synchronized audio experiences with other players in proximity

---

## 3. Target Users

### Primary Users:
- **Server Owners/Administrators:** Need easy-to-configure, framework-compatible scripts
- **Players:** Want immersive roleplay experiences with period-appropriate music
- **Saloon/Business Owners (RP):** Need entertainment options for their establishments

### User Personas:
1. **"Saloon Keeper Sally"** - Runs a roleplay saloon, wants background ambiance
2. **"Technical Tom"** - Server admin who needs easy configuration
3. **"Immersive Ian"** - Player who values historical accuracy and atmosphere

---

## 4. Core Features & Requirements

### 4.1 Framework Compatibility (CRITICAL)
**Requirement:** Support multiple RedM frameworks with zero modifications

**Supported Frameworks:**
- lxr-core
- rsg-core
- VORP Framework
- QR-Core (RedM variant)
- Standalone mode (no framework dependency)

**Implementation Approach:**
```
Framework Detection System:
├── Auto-detect installed framework on resource start
├── Load appropriate bridge module
├── Fallback to standalone mode if no framework detected
└── Use unified API internally
```

**Reasoning:** Different servers use different frameworks. A truly useful script must work everywhere without code changes.

### 4.2 Keybinding System
**Primary Keybind:** ALT (configurable in config)

**Interaction Flow:**
1. Player approaches gramophone prop (within configurable distance, default 2.5m)
2. On-screen prompt appears: "Press [ALT] to use Gramophone"
3. Pressing ALT opens the playlist selection menu
4. Player selects playlist or track
5. Music starts playing with spatial audio

**Additional Keybinds:**
- ESC: Close menu
- Arrow Keys/Mouse: Navigate playlists
- ENTER: Confirm selection
- Separate keybind (configurable): Stop music

**Reasoning:** ALT is easily accessible but not commonly used for other actions in RedM, reducing conflicts.

### 4.3 Playlist Selection UI

**UI Design Philosophy:** Period-appropriate, immersive, non-intrusive

**Menu Structure:**
```
┌─────────────────────────────────────┐
│   THE GRAMOPHONE MUSIC SELECTION    │
├─────────────────────────────────────┤
│  ♪ Ragtime Classics (8 tracks)      │
│  ♪ Marching Band Favorites (6)      │
│  ♪ Folk & Country Ballads (10)      │
│  ♪ Classical Pieces (7)             │
│  ♪ Saloon Piano Tunes (12)          │
│  ♪ Religious Hymns (5)               │
│  ♪ Dance Hall Melodies (9)          │
│                                      │
│  [Current: None Playing]             │
│  [Volume: ████████░░ 80%]            │
└─────────────────────────────────────┘
```

**UI Features:**
- Vintage paper/parchment texture background
- Period-appropriate fonts (serif, old-style)
- Visual indication of currently playing track
- Volume control slider
- Track duration display
- "Now Playing" indicator visible to nearby players

**Reasoning:** UI must match the 1899 setting to maintain immersion while providing modern usability.

### 4.4 Configuration System

**Config File Structure:** `config.lua`

**Key Configuration Options:**
```lua
Config = {}

-- Framework Settings
Config.Framework = "auto" -- auto, lxr-core, rsg-core, vorp, standalone

-- Interaction Settings
Config.InteractionKey = "LMENU" -- Default: ALT (LMENU in RedM)
Config.InteractionDistance = 2.5 -- meters
Config.UseThirdEye = false -- Integration with third-eye targeting systems
Config.ShowPrompt3D = true -- Show 3D prompt above gramophone

-- Audio Settings
Config.DefaultVolume = 0.5 -- 0.0 to 1.0
Config.MaxHearingDistance = 25.0 -- meters
Config.SpatialAudio = true -- Use 3D positional audio
Config.FadeInDuration = 2.0 -- seconds
Config.FadeOutDuration = 1.5 -- seconds

-- Prop Settings
Config.GramophoneProps = {
    "p_phonograph01x",
    "p_phonograph02x", 
    "p_int_phonograph01",
    -- Add custom props here
}

-- Playlist Settings
Config.EnablePlaylistShuffle = true
Config.AutoPlayNext = true
Config.ShowNowPlaying = true
Config.NowPlayingDuration = 5000 -- milliseconds

-- Permission Settings
Config.RequireItem = false -- Require item to use gramophone
Config.ItemName = "gramophone_record" -- If RequireItem = true
Config.RequireJob = false -- Restrict to specific jobs
Config.AllowedJobs = {"saloonkeeper", "musician"}

-- Economy Settings
Config.ChargePerPlay = false -- Charge money per song
Config.PlayCost = 5 -- Cost per song
Config.BusinessIncome = true -- Give income to business owner
Config.BusinessCut = 0.5 -- 50% of play cost goes to business
```

**Reasoning:** Extensive configuration allows server owners to customize the script to their specific needs without touching code.

### 4.5 Music Curation (1899 Era)

**Historical Context:**
- Phonographs became commercially available in the 1890s
- Early recordings featured cylinders (later discs)
- Popular genres: Ragtime, marches, classical, folk, religious hymns

**Curated Playlists (YouTube Integration):**

**1. Ragtime Classics (1899-1900s)**
- Scott Joplin - Maple Leaf Rag (1899)
- Scott Joplin - The Entertainer (1902, but style existed)
- Joseph Lamb - Ragtime pieces
- Period-appropriate piano ragtime

**2. Marching Band & Brass**
- John Philip Sousa marches
- Military band recordings
- Parade music

**3. Folk & Country Ballads**
- Traditional folk songs
- Cowboy ballads
- Irish/Scottish immigrant music
- Old-time country

**4. Classical Pieces**
- Popular opera arias
- Classical piano pieces
- String quartets
- Beethoven, Mozart (older but still played)

**5. Saloon Piano**
- Honky-tonk piano styles
- Barroom ballads
- Dance hall music

**6. Religious Hymns**
- Gospel songs
- Church hymns
- Spiritual music

**7. Dance Hall Melodies**
- Waltzes
- Polkas
- Two-steps

**Technical Implementation:**
- Use xSound resource for RedM (or similar audio library)
- Stream from YouTube URLs (server-configured)
- Cache playlist metadata
- Fallback URLs in case of dead links

**Reasoning:** Historical accuracy is crucial for immersion. These genres were genuinely available in 1899.

---

## 5. Enhanced Features & Logic Suggestions

### 5.1 Proximity-Based Features

**Suggestion: Dynamic Audio Zones**
```
Concept: Create audio "zones" around gramophones
├── Intimate Zone (0-5m): Full volume, clear audio
├── Ambient Zone (5-15m): Reduced volume, slight muffling
├── Distant Zone (15-25m): Faint background audio
└── Outside Range (25m+): No audio
```

**Reasoning:** Enhances realism - you wouldn't hear a gramophone clearly from 50 meters away.

**Implementation Logic:**
1. Calculate distance between player and gramophone every 500ms
2. Adjust volume based on distance formula: `volume = maxVolume * (1 - (distance / maxDistance))`
3. Apply audio occlusion if inside building vs. outside

### 5.2 Multi-Gramophone Support

**Suggestion: Multiple Active Gramophones**

**Logic:**
- Support multiple gramophones playing different music simultaneously
- Each gramophone maintains its own state (playing, paused, track, volume)
- Players hear audio from nearest gramophones only (priority system)
- Prevent audio chaos: limit to 3 nearest gramophone sources

**Database/State Storage:**
```lua
ActiveGramophones = {
    [netId] = {
        coords = vector3(x, y, z),
        currentTrack = "playlist_1_track_3",
        volume = 0.8,
        startTime = timestamp,
        owner = serverId
    }
}
```

**Reasoning:** Large events or towns might have multiple gramophones. System must handle this gracefully.

### 5.3 Ownership & Permissions

**Suggestion: Gramophone Ownership System**

**Features:**
- Only gramophone "owner" (person who placed it or business owner) can change tracks
- Others can request songs (optional, requires owner approval)
- Job-based restrictions (saloon keeper can control saloon gramophone)
- Item-based access (need "gramophone key" item)

**Logic Flow:**
```
Player Interacts:
├── Check if player is owner → Full control
├── Check if player has permission (job/item) → Limited control
├── Check if public access enabled → Basic playback
└── Deny access → Show "You don't own this gramophone" message
```

**Reasoning:** Prevents griefing where random players change music in someone's business.

### 5.4 Record Collection System

**Suggestion: Physical Record Items**

**Concept:** Players can collect and trade vinyl records/cylinders

**Features:**
- Add items: `gramophone_record_ragtime`, `gramophone_record_classical`, etc.
- Players must own records to play those playlists
- Records can be bought from stores, found, or crafted
- Rare records for exclusive tracks

**Economy Integration:**
```lua
Record Tiers:
├── Common Records: $5-10 (basic folk, hymns)
├── Uncommon Records: $15-25 (popular ragtime, marches)
├── Rare Records: $50-100 (special classical, rare recordings)
└── Legendary Records: $200+ (exclusive tracks, famous performers)
```

**Reasoning:** Adds gameplay depth and economic opportunity. Creates collectible system.

### 5.5 Gramophone Condition/Durability

**Suggestion: Maintenance System**

**Features:**
- Gramophones degrade with use
- Degraded gramophones have:
  - Lower volume
  - Audio distortion/crackling
  - Skip tracks occasionally
- Require "gramophone oil" or "maintenance kit" to repair
- Adds realism and creates item demand

**Degradation Formula:**
```
Condition = 100% (new)
Each song played: -0.5% condition
Below 50%: Start audio artifacts
Below 25%: Frequent skipping
0%: Gramophone breaks, needs repair
```

**Reasoning:** Adds realism and maintenance gameplay. Creates demand for repair items.

### 5.6 Social Features

**Suggestion: Shared Listening Experience**

**Features:**
- "Now Playing" notifications to nearby players
- Dance emotes sync with music tempo
- Applause/reaction system after songs
- Lyrics display for certain songs (if available)
- Request queue system for public gramophones

**Social Integration:**
```
When song starts:
├── Notify players within 15m: "♪ Now playing: Maple Leaf Rag"
├── Show song info in chat (optional)
├── Trigger ambient reactions from NPCs (if enabled)
└── Create "social gathering" bonus (small XP/mood boost)
```

**Reasoning:** Music is inherently social. This encourages player interaction and roleplay.

### 5.7 Business Integration

**Suggestion: Saloon/Business Revenue System**

**Features:**
- Business owners can set gramophone to generate income
- Players pay small fee per song or time-based
- Revenue goes to business owner
- Statistics tracking (most played songs, revenue generated)
- Leaderboards for most popular saloons

**Business Logic:**
```lua
if Config.BusinessIncome then
    OnTrackStart:
        ├── Charge player Config.PlayCost
        ├── Give Config.BusinessCut to business owner
        ├── Give remainder to server economy (tax)
        └── Log transaction
end
```

**Reasoning:** Creates economic gameplay loop for business owners. Makes gramophones valuable.

### 5.8 Event System

**Suggestion: Scheduled Music Events**

**Features:**
- Scheduled concerts/shows at specific times
- Special event playlists (holidays, celebrations)
- Automatic announcements when events start
- Exclusive tracks available only during events
- Rewards for attending events

**Event Example:**
```lua
Event: "Saturday Night Saloon Social"
Time: Saturday 8 PM Server Time
Location: Valentine Saloon
Playlist: Special curated upbeat dance music
Bonus: 2x business income, unique emotes available
```

**Reasoning:** Creates recurring content and reasons for players to gather. Builds community.

### 5.9 Historical Accuracy Mode

**Suggestion: Toggle for Ultra-Realism**

**Features:**
- Enable "Historical Mode" in config
- Limits songs to only those recorded before 1900
- Adds audio quality reduction (authentic cylinder phonograph sound)
- Limits gramophone availability based on location (cities more likely)
- Requires winding mechanism (interact every 10 minutes to "wind" gramophone)

**Reasoning:** Some servers prioritize extreme historical accuracy. This caters to that audience.

### 5.10 Integration APIs

**Suggestion: Developer API for Other Scripts**

**Exports:**
```lua
-- Play music on specific gramophone
exports['twl_gramaphone']:PlayTrack(gramophoneId, playlistId, trackId)

-- Stop music
exports['twl_gramaphone']:StopGramophone(gramophoneId)

-- Check if gramophone is playing
exports['twl_gramaphone']:IsPlaying(gramophoneId)

-- Get current track info
exports['twl_gramaphone']:GetCurrentTrack(gramophoneId)

-- Trigger event-based control
TriggerEvent('twl_gramaphone:playTrack', data)
```

**Use Cases:**
- Other scripts can control gramophone (e.g., automated saloon script)
- Event scripts can trigger special music
- Admin panels can remotely control gramophones

**Reasoning:** Allows integration with existing server ecosystems. Increases script value.

---

## 6. Technical Architecture

### 6.1 File Structure
```
twl_gramaphone/
├── fxmanifest.lua              # Resource manifest
├── config.lua                  # User configuration
├── README.md                   # Documentation
├── PRD.md                      # This document
├── server/
│   ├── main.lua               # Server-side logic
│   ├── framework.lua          # Framework detection & bridges
│   └── database.lua           # Data persistence (optional)
├── client/
│   ├── main.lua               # Client-side logic
│   ├── ui.lua                 # UI rendering
│   ├── interaction.lua        # Keybinds & prompts
│   └── audio.lua              # Audio management
├── shared/
│   ├── utils.lua              # Shared utility functions
│   └── playlists.lua          # Playlist definitions
├── bridge/
│   ├── lxr-core.lua          # lxr-core integration
│   ├── rsg-core.lua          # rsg-core integration
│   ├── vorp.lua              # VORP integration
│   └── standalone.lua         # No-framework mode
├── html/
│   ├── index.html            # NUI interface
│   ├── style.css             # UI styling
│   └── script.js             # UI logic
└── locales/
    ├── en.lua                # English translations
    └── es.lua                # Spanish translations (optional)
```

### 6.2 Data Flow

```
Player Interaction Flow:
1. Player approaches gramophone → Client detects proximity
2. Client shows prompt → Player presses ALT
3. Client sends request to server → Server validates permissions
4. Server responds with available playlists → Client opens UI
5. Player selects track → Client sends selection to server
6. Server broadcasts to nearby players → All clients start audio
7. Audio plays with spatial positioning → Synced across clients
8. Track ends → Server can auto-play next or notify completion
```

### 6.3 Framework Bridge System

**Auto-Detection Logic:**
```lua
function DetectFramework()
    if GetResourceState('lxr-core') == 'started' then
        return 'lxr-core'
    elseif GetResourceState('rsg-core') == 'started' then
        return 'rsg-core'
    elseif GetResourceState('vorp_core') == 'started' then
        return 'vorp'
    else
        return 'standalone'
    end
end
```

**Unified Bridge API:**
```lua
Framework = {}

Framework.GetPlayer = function(source)
    -- Returns player object regardless of framework
end

Framework.GetPlayerMoney = function(source)
    -- Returns player money across frameworks
end

Framework.RemoveMoney = function(source, amount)
    -- Removes money across frameworks
end

Framework.HasItem = function(source, item)
    -- Checks inventory across frameworks
end
```

**Reasoning:** Abstraction layer ensures code works everywhere without modification.

---

## 7. Success Metrics

### Key Performance Indicators (KPIs):
1. **Compatibility:** Successfully runs on 100% of target frameworks without errors
2. **Performance:** No noticeable FPS drop when playing music (< 1% CPU usage)
3. **User Adoption:** Used by at least 50% of server players within first month
4. **Stability:** Zero critical bugs after 1 week of testing
5. **Satisfaction:** Positive feedback from server owners and players

### Testing Criteria:
- Works on all specified frameworks
- No console errors during operation
- Audio syncs properly across multiple clients
- UI is responsive and intuitive
- Configuration options all function correctly
- Handles edge cases (disconnect during playback, multiple gramophones, etc.)

---

## 8. Implementation Phases

### Phase 1: Core Functionality (MVP)
- [ ] Framework bridge system
- [ ] Basic keybind interaction
- [ ] Simple playlist selection
- [ ] Audio playback (single track)
- [ ] Config system

### Phase 2: Enhanced Features
- [ ] Full UI implementation
- [ ] Multiple playlists
- [ ] Spatial audio
- [ ] Volume controls
- [ ] Proximity detection

### Phase 3: Advanced Features
- [ ] Multi-gramophone support
- [ ] Ownership system
- [ ] Permission system
- [ ] Economy integration

### Phase 4: Polish & Extras
- [ ] Record collection system
- [ ] Social features
- [ ] Event system
- [ ] Statistics tracking
- [ ] Localization

---

## 9. Risks & Mitigations

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| Framework updates break compatibility | High | Medium | Use stable APIs, test regularly, maintain bridge modules |
| YouTube links die over time | Medium | High | Multiple fallback URLs, local file support option |
| Audio sync issues across clients | High | Medium | Use server timestamps, implement sync correction |
| Performance impact on low-end PCs | Medium | Low | Optimize audio streaming, configurable quality |
| Abuse/griefing with loud music | Medium | Medium | Permission system, volume limits, admin controls |
| Complex configuration overwhelming | Low | Medium | Provide sane defaults, clear documentation |

---

## 10. Open Questions for User Review

Before implementation, please confirm:

1. **Framework Priority:** Which framework should we test first? (Recommend: VORP as most common)

2. **UI Style:** 
   - Option A: Full NUI with HTML/CSS (modern, feature-rich)
   - Option B: Native RedM prompts (simple, performance-friendly)
   - Recommendation: Option A for better UX

3. **Audio Source:**
   - Option A: YouTube streaming (easy updates, requires internet)
   - Option B: Local audio files (reliable, larger resource size)
   - Option C: Both options configurable
   - Recommendation: Option C

4. **Scope for First Release:**
   - Minimal (Phase 1 only): Core features, fast delivery
   - Standard (Phase 1-2): Good feature set, balanced
   - Complete (Phase 1-4): All features, longer development
   - Recommendation: Standard for initial release

5. **Record Collection System:** Include in first release or save for update?
   - Recommendation: Save for update (v1.1)

6. **Economy Integration:** Should this be mandatory or optional?
   - Recommendation: Optional (config toggle)

7. **Database Requirements:** Should we persist gramophone states across restarts?
   - Recommendation: Yes, use framework's database system

8. **Admin Controls:** What admin features are needed?
   - Remote stop/start
   - Volume override
   - Playlist management
   - Ban players from using gramophones
   - Recommendation: All of the above

9. **Prop Interaction Method:**
   - Option A: Keybind when near prop
   - Option B: Third-eye/target system
   - Option C: Both options
   - Recommendation: Option C

10. **Licensing:** What license for this script?
    - MIT (open source, permissive)
    - GPL (open source, copyleft)
    - Proprietary (closed source)
    - Recommendation: MIT for community adoption

---

## 11. Recommendations Summary

**Immediate Actions:**
1. ✅ **Approve this PRD** with any modifications needed
2. ✅ **Answer open questions** above
3. ✅ **Prioritize framework** for initial testing
4. ✅ **Provide any additional requirements** or constraints

**Suggested Scope for V1.0:**
- Core framework support (all listed frameworks)
- Keybind interaction system
- Full UI with playlist selection
- 50+ curated period-appropriate tracks
- Spatial audio with proximity
- Basic configuration options
- Permission system
- Economy integration (optional)

**Future Versions:**
- V1.1: Record collection system, durability
- V1.2: Event system, statistics
- V1.3: Advanced social features, APIs
- V2.0: Historical accuracy mode, custom music uploads

---

## 12. Additional Logic & Reasoning

### Why Framework-Agnostic is Critical:
The RedM community is fragmented across frameworks. A script that only works on one framework limits adoption by 70-80%. By supporting all major frameworks, we:
- Maximize potential users
- Increase script value
- Build better reputation
- Future-proof against framework changes

### Why 1899 Era Music Matters:
Historical immersion breaks when modern music plays. By curating period-appropriate music:
- Maintains roleplay atmosphere
- Educates players about actual historical music
- Differentiates from generic "jukebox" scripts
- Shows attention to detail and quality

### Why Spatial Audio is Essential:
RedM is a 3D game. Music should behave like real sound:
- Creates realistic audio environment
- Allows players to "move away" if they don't like music
- Prevents server-wide audio spam
- More performant (only loads for nearby players)

### Why Extensive Configuration:
Every server is unique. Extensive config options:
- Eliminates need for code modifications
- Makes script usable for various roleplay styles (strict vs. casual)
- Allows gradual feature adoption
- Reduces support requests

### Why UI Over Simple Menus:
A polished UI:
- Improves user experience significantly
- Shows professionalism
- Easier to add features later
- More intuitive for non-technical players
- Can match server theme/aesthetic

---

## 13. Conclusion

This PRD outlines a comprehensive gramophone script that will:
- ✅ Work across all major RedM frameworks
- ✅ Provide immersive 1899-era music experience
- ✅ Offer extensive customization for server owners
- ✅ Create engaging gameplay loops (economy, collection, social)
- ✅ Maintain high performance and stability
- ✅ Support future enhancements and integrations

**Next Steps:**
Please review this document and provide feedback on:
1. Any features to add, remove, or modify
2. Answers to open questions (Section 10)
3. Priority and timeline expectations
4. Any technical constraints or requirements

Once approved, we can proceed with implementation following the phased approach outlined in Section 8.

---

**Document Status:** 📋 **AWAITING REVIEW**  
**Author:** AI Development Assistant  
**Reviewers:** Project Owner  
**Approval Required Before:** Implementation begins
