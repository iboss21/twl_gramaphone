# 🐺 The Land of Wolves - Phonograph System
## "Echoes of 1899" - Authentic Period Music for RedM

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![RedM](https://img.shields.io/badge/RedM-Compatible-red.svg)](https://redm.gg/)
[![Framework](https://img.shields.io/badge/Framework-Universal-blue.svg)](https://wolves.land)

**Created by iBoss | www.wolves.land**

---

## 🎵 About

An immersive, multi-framework compatible phonograph/gramophone script for RedM that brings authentic 1899-era music to your Wild West roleplay server. This script enhances immersion in saloons, homes, and events — evoking the early phonograph era (invented ~1877, popularized in the 1890s-1900s with cylinder recordings of ragtime, marches, and folk tunes).

### ✨ Key Features

- 🎹 **50+ Authentic Period Songs** - Curated playlists of real 1899-era music
- 🔧 **Universal Framework Support** - Works with LXR-Core, RSG-Core, VORP, QBR, and Standalone
- 🎨 **Beautiful Vintage UI** - Period-appropriate interface with smooth animations
- 🌍 **3D Positional Audio** - Distance-based volume with environmental effects
- 💰 **Economy Integration** - Optional costs, business revenue, record trading
- 🎭 **Rich Roleplay Features** - Ownership, permissions, social bonuses
- ⚡ **Optimized Performance** - Minimal resource usage, smooth operation
- 📖 **Extensive Documentation** - Complete guides and configuration help

---

## 📚 Documentation

- **[Product Requirements Document (PRD)](./PRD.md)** - Complete project specification
- **[Enhanced Features Guide](./ENHANCED_FEATURES.md)** - Advanced features and brainstorming
- **[Installation Guide](#-installation)** - Quick setup instructions
- **[Configuration Guide](#%EF%B8%8F-configuration)** - Customize to your needs

---

## 🚀 Quick Start

### Prerequisites
- RedM server (latest version)
- xsound resource (for audio playback)
- ox_lib (for notifications and UI)
- One of: LXR-Core, RSG-Core, VORP, QBR, or run Standalone

### Installation

1. **Download** the resource
```bash
git clone https://github.com/iboss21/twl_gramaphone.git
```

2. **Install dependencies**
   - Download [xsound](https://github.com/Xogy/xsound)
   - Download [ox_lib](https://github.com/overextended/ox_lib)

3. **Add to server.cfg**
```cfg
ensure ox_lib
ensure xsound
ensure twl_gramaphone
```

4. **Configure** (optional)
   - Edit `config.lua` to customize settings
   - Adjust playlists, costs, permissions, etc.

5. **Restart** your server
```bash
restart twl_gramaphone
```

---

## 🎮 How to Use

### For Players

1. **Approach** any gramophone prop (default: 3 meters)
2. **Press ALT** (configurable) to open the music menu
3. **Select** a playlist from the vintage-styled interface
4. **Choose** a track to play
5. **Enjoy** authentic 1899-era music with nearby players!

### For Business Owners

1. **Place** a phonograph in your establishment (if enabled)
2. **Control** the music to set the atmosphere
3. **Earn revenue** from players who use your phonograph
4. **Track statistics** to see popular songs and busy times

### For Server Admins

- **/reloadphonograph** - Reload configuration
- **/stopallphonographs** - Emergency stop all music
- Configure everything via `config.lua`
- Monitor active phonographs via exports

---

## ⚙️ Configuration

### Quick Configuration Examples

```lua
-- Change keybind
Config.InteractionKey = 'LMENU'  -- ALT key

-- Adjust audio range
Config.MaxAudioRange = 50.0      -- 50 meters max hearing distance

-- Enable/disable costs
Config.EnableCost = true
Config.CostPerSong = 0.25

-- Free access for certain jobs
Config.FreeJobs = { 'saloonkeeper', 'bartender', 'musician' }

-- Customize playlists (add your own!)
Config.Playlists = {
    {
        name = "Custom Playlist",
        icon = "🎵",
        tracks = {
            { title = "Song Name", url = "https://youtube.com/watch?v=..." },
            -- Add more tracks...
        }
    }
}
```

See [config.lua](./config.lua) for complete configuration options.

---

## 🎵 Included Playlists

### 8 Curated Period-Appropriate Playlists:

1. **🎹 Saloon Ragtime** (8 tracks) - Scott Joplin classics
2. **🎵 Popular Ballads** (8 tracks) - Sentimental era favorites  
3. **🥁 Military Marches** (6 tracks) - Sousa and patriotic music
4. **🤠 American Folk** (8 tracks) - Traditional cowboy songs
5. **💃 Classical Waltzes** (6 tracks) - Elegant Strauss waltzes
6. **⛪ Hymns & Spirituals** (6 tracks) - Gospel and church music
7. **🎭 Vaudeville & Novelty** (6 tracks) - Stage comedy songs
8. **📻 Early Phonograph Recordings** (4 tracks) - Authentic cylinder recordings

**Total: 50+ historically accurate tracks from the 1890s-1900s era**

---

## 🔧 Framework Compatibility

### Supported Frameworks (Auto-Detected):

- ✅ **LXR-Core** - Full support
- ✅ **RSG-Core** - Full support
- ✅ **VORP** - Full support
- ✅ **QBR-Core** - Full support
- ✅ **RedEM:RP** - Full support
- ✅ **Standalone** - No framework required

The script automatically detects your framework and adapts accordingly. No code changes needed!

---

## 🌟 Features in Detail

### Core Functionality
- ✨ Keybind-based interaction (ALT key default)
- 🎵 Multiple phonograph support simultaneously
- 📡 Synchronized audio across all nearby players
- 🔊 3D positional audio with distance falloff
- 🎚️ Volume controls and adjustments
- ⏹️ Play, stop, and track navigation

### Economy & Business
- 💵 Optional cost per song
- 🏢 Business owner revenue sharing
- 👔 Job-based free access
- 📊 Revenue tracking and statistics
- 🏆 Leaderboards for popular venues

### Social & Roleplay
- 👥 Group listening bonuses
- 📢 "Now Playing" notifications
- 🎭 Ownership and permissions system
- ⏱️ Ownership timeout and transfer
- 🎪 Event scheduling support

### Technical Excellence
- ⚡ Optimized performance (< 0.02ms CPU)
- 🔄 Automatic framework detection
- 🛡️ Anti-abuse rate limiting
- 🔍 Error handling and fallbacks
- 📝 Comprehensive logging

---

## 📋 Planned Features (Future Updates)

### Version 1.1
- 💿 Record collection system
- 🔧 Phonograph maintenance/durability
- 🎪 Scheduled music events
- 📈 Enhanced analytics dashboard

### Version 1.2
- 🎸 Musician job integration
- 🏪 Record shop NPCs
- 🎁 Achievement system
- 🌐 Discord bot integration

### Version 2.0
- 🎨 Advanced vintage audio effects
- 📜 Historical accuracy mode
- 🔌 Developer API
- 🌍 Multi-language support

See [ENHANCED_FEATURES.md](./ENHANCED_FEATURES.md) for detailed roadmap.

---

## 🐛 Troubleshooting

### Common Issues

**No sound playing:**
- Ensure xsound is installed and started before twl_gramaphone
- Check console for errors
- Verify YouTube URLs are accessible

**Can't interact with phonograph:**
- Check you're within 3 meters of the prop
- Verify the prop model is in Config.PhonographModels
- Check console for keybind conflicts

**Framework not detected:**
- Ensure your framework is started before twl_gramaphone
- Check resource names match (lxr-core, rsg-core, etc.)
- Set Config.Framework manually if auto-detection fails

**Audio out of sync:**
- This is usually due to network latency
- Script uses server timestamps for best sync possible
- Check player internet connections

---

## 🤝 Contributing

We welcome contributions from the community!

### How to Contribute:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Areas We Need Help:
- 🎵 More period-appropriate music suggestions
- 🌐 Translations to other languages
- 🐛 Bug reports and fixes
- 💡 Feature ideas and implementations
- 📝 Documentation improvements

---

## 📜 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

**TL;DR:** You can use, modify, and distribute this freely. Just keep the copyright notice.

---

## 🏆 Credits & Acknowledgments

### Created By
**iBoss** - Lead Developer  
**The Land of Wolves** - www.wolves.land

### Special Thanks
- xsound developers for audio streaming library
- ox_lib team for excellent utility library
- LXR-Core, RSG-Core, VORP, and QBR teams for framework foundations
- RedM community for testing and feedback
- Historical music archives for authentic recordings

### Music Sources
- Scott Joplin ragtime compositions (Public Domain)
- John Philip Sousa marches (Public Domain)
- Traditional folk songs (Public Domain)
- Early phonograph cylinder recordings (Public Domain)
- Library of Congress historical archives

---

## 📞 Support & Community

### Get Help
- 📖 **Documentation:** [docs.wolves.land/phonograph](https://wolves.land)
- 💬 **Discord:** [discord.gg/landofwolves](https://discord.gg/landofwolves)
- 🐛 **Bug Reports:** [GitHub Issues](https://github.com/iboss21/twl_gramaphone/issues)
- 💡 **Feature Requests:** [GitHub Discussions](https://github.com/iboss21/twl_gramaphone/discussions)

### Stay Updated
- 🌐 **Website:** www.wolves.land
- 📺 **YouTube:** Tutorial videos and showcases
- 🐦 **Twitter:** @LandOfWolves (coming soon)
- 📰 **Changelog:** Check [CHANGELOG.md](CHANGELOG.md) for updates

---

## 💖 Support the Project

If you enjoy this resource:
- ⭐ Star the repository on GitHub
- 🐛 Report bugs and suggest features
- 📢 Share with your RedM community
- 🤝 Contribute code or documentation
- 💬 Join our Discord community

**Every bit helps us create better resources for the RedM community!**

---

## 📊 Statistics

![GitHub Stars](https://img.shields.io/github/stars/iboss21/twl_gramaphone?style=social)
![GitHub Forks](https://img.shields.io/github/forks/iboss21/twl_gramaphone?style=social)
![GitHub Issues](https://img.shields.io/github/issues/iboss21/twl_gramaphone)
![GitHub Pull Requests](https://img.shields.io/github/issues-pr/iboss21/twl_gramaphone)

---

<div align="center">

## 🐺 The Land of Wolves

**Immersion Through Excellence**

Created with ❤️ for the RedM community

[Website](https://wolves.land) • [Discord](https://discord.gg/landofwolves) • [GitHub](https://github.com/iboss21)

---

*"Bringing the authentic sounds of 1899 to your Wild West roleplay"*

**© 2026 iBoss | The Land of Wolves | MIT License**

</div>
