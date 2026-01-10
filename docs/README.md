# 📚 TWL Gramophone - Documentation Index

Welcome to the comprehensive documentation for **The Land of Wolves Gramophone System**. This index will help you find the information you need quickly.

---

## 🚀 Getting Started

### Quick Links
- **[Installation Guide](./guides/INSTALL.md)** - Step-by-step installation instructions
- **[Contributing Guide](./guides/CONTRIBUTING.md)** - How to contribute to the project
- **[Main README](../README.md)** - Project overview and quick start

---

## 📖 Guides

These guides will help you install, configure, and use the gramophone system:

- **[Installation Guide](./guides/INSTALL.md)**
  - Prerequisites
  - Installation steps
  - Configuration basics
  - Troubleshooting common issues

- **[Contributing Guide](./guides/CONTRIBUTING.md)**
  - How to contribute code
  - Code style guidelines
  - Pull request process
  - Bug reporting

---

## 🔧 Technical Documentation

Detailed technical specifications and implementation details:

- **[Product Requirements Document (PRD)](./technical/PRD.md)**
  - Complete project specification
  - Feature requirements
  - Technical architecture
  - System design

- **[Project Structure](./technical/PROJECT_STRUCTURE.md)**
  - File organization
  - Module descriptions
  - Code architecture
  - Dependencies

- **[Implementation Summary](./technical/IMPLEMENTATION_SUMMARY.md)**
  - Implementation details
  - Development timeline
  - Technical decisions
  - Code patterns

- **[Security Documentation](./technical/SECURITY.md)**
  - Security features
  - Brand protection system
  - Integrity validation
  - Best practices

---

## 📋 Reference

Reference documentation and changelogs:

- **[Enhanced Features](./reference/ENHANCED_FEATURES.md)**
  - Advanced features overview
  - Feature brainstorming
  - Future enhancements
  - Extension ideas

- **[Changelog](./reference/CHANGELOG.md)**
  - Version history
  - Release notes
  - Breaking changes
  - Migration guides

---

## 🎯 Configuration Reference

### Main Configuration File: `config.lua`

The gramophone system is highly configurable. All settings can be adjusted in the `config.lua` file located in the root directory.

#### Key Configuration Sections:

1. **Framework Settings**
   - Auto-detection or manual framework selection
   - Supports: LXR-Core, RSG-Core, VORP, QBR, and Standalone

2. **Interaction Settings**
   - Keybind configuration
   - Interaction distance
   - 3D prompt settings
   - Third-eye integration

3. **Audio Settings**
   - Default volume levels
   - Maximum hearing distance
   - Spatial audio configuration
   - Fade in/out durations

4. **Performance Settings**
   - Update intervals for position tracking
   - Detection intervals
   - Cleanup intervals
   - Optimization timings

5. **UI & Display Settings**
   - 3D text customization
   - Prompt text configuration
   - Display offsets

6. **Permission & Economy**
   - Item requirements
   - Job restrictions
   - Cost per song
   - Business income settings

7. **Advanced Options**
   - Debug mode
   - Keybind mapping
   - Security settings
   - Monitoring intervals

---

## 🎵 Playlist System

### Playlist Configuration: `shared/playlists.lua`

Playlists are defined in the `shared/playlists.lua` file. Each playlist contains:
- Unique ID
- Display name
- Description
- Era/category
- List of tracks with URLs

### Adding Custom Playlists

1. Open `shared/playlists.lua`
2. Add a new playlist entry following the existing format
3. Include track information (title, artist, URL, duration)
4. Save and restart the resource

---

## 🔌 Framework Integration

The gramophone system supports multiple frameworks out of the box:

- **LXR-Core** - Full support
- **RSG-Core** - Full support
- **VORP** - Full support
- **QBR** - Full support
- **Standalone** - Works without any framework

Framework detection is automatic, but can be manually configured in `config.lua`.

---

## 🐛 Troubleshooting

### Common Issues

1. **Gramophone not detected**
   - Check `Config.InteractionDistance` in config.lua
   - Verify gramophone prop models are correct
   - Ensure xsound is properly installed

2. **No audio playing**
   - Verify xsound resource is started
   - Check audio URLs are valid
   - Review browser console for errors

3. **Framework not detected**
   - Set `Config.Framework` manually if auto-detection fails
   - Ensure framework resource is started before gramophone

4. **Security warnings**
   - Ensure resource folder is named `twl_gramaphone`
   - Do not modify core security files
   - Check server console for specific errors

---

## 💬 Support & Community

- **Website:** [www.wolves.land](https://wolves.land)
- **Creator:** iBoss
- **GitHub:** [iboss21/twl_gramaphone](https://github.com/iboss21/twl_gramaphone)

---

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

**Created by iBoss | The Land of Wolves | www.wolves.land**
