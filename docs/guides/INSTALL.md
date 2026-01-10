# 🐺 TWL Gramophone - Installation Guide

## Quick Installation

### 1. Prerequisites

Make sure you have these resources installed and started **BEFORE** twl_gramaphone:

- **ox_lib** - Required for notifications and UI components
- **xsound** - Required for audio streaming
- Your framework: lxr-core, rsg-core, vorp_core, qbr-core, or standalone

### 2. Download & Install

1. Download or clone this repository
2. Place the `twl_gramaphone` folder in your server's `resources` directory
3. Add to your `server.cfg`:

```cfg
ensure ox_lib
ensure xsound
ensure twl_gramaphone
```

**Important:** The order matters! ox_lib and xsound must start before twl_gramaphone.

### 3. Configuration

Edit `config.lua` to customize:

- Interaction key (default: ALT/LMENU)
- Audio settings (volume, distance)
- Economy settings (enable costs, set prices)
- Permission settings (required jobs, items)

### 4. Restart Server

```bash
restart twl_gramaphone
```

Or just restart your entire server to ensure all resources load in order.

## How to Use

### For Players

1. Find a gramophone prop in the world (look for phonograph models)
2. Get within 3 meters of the gramophone
3. Press **ALT** (or your configured key)
4. Select a playlist and track from the vintage menu
5. Enjoy authentic 1899-era music!

### For Admins

**Commands:**
- `/stopallgramophones` - Stop all playing gramophones (admin only)
- `/reloadgramophone` - Reload configuration

## Troubleshooting

### No sound playing?
- Make sure xsound is installed and started
- Check the server console for errors
- Verify YouTube URLs are accessible from your server

### Can't interact with gramophone?
- Check you're within 3 meters of a phonograph prop
- Make sure the prop model is in `Config.PhonographModels`
- Try different gramophone props

### Framework not detected?
- Ensure your framework resource is started before twl_gramaphone
- Check the resource name matches (lxr-core, rsg-core, vorp_core, etc.)
- Set `Config.Framework` manually if auto-detection fails

### Menu not opening?
- Make sure ox_lib is installed and working
- Check browser console (F8) for JavaScript errors
- Verify NUI is not blocked by other resources

## Support

- **Documentation:** Full README.md in the main folder
- **Issues:** Report on GitHub
- **Website:** www.wolves.land
- **Discord:** Join our community for support

## Credits

Created by **iBoss** for **The Land of Wolves**  
Licensed under MIT - Free to use and modify

---

🐺 **Immersion Through Excellence** 🐺
