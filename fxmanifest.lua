--[[
    ████████╗██╗    ██╗██╗          ██████╗ ██████╗  █████╗ ███╗   ███╗ ██████╗ ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
    ╚══██╔══╝██║    ██║██║         ██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
       ██║   ██║ █╗ ██║██║         ██║  ███╗██████╔╝███████║██╔████╔██║██║   ██║██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
       ██║   ██║███╗██║██║         ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║   ██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
       ██║   ╚███╔███╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
       ╚═╝    ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                                                                                              
    🐺 The Land of Wolves - Phonograph System
    "Echoes of 1899" - Authentic Period Music for RedM
    
    Version: 1.0.0
    Author: iBoss
    Website: www.wolves.land
    Server: The Land of Wolves
    
    A comprehensive phonograph/gramophone system featuring:
    - Multi-framework support (LXR-Core, RSG-Core, VORP, QBR, RedEM, Standalone)
    - 8 curated playlists with 50+ authentic 1899-era tracks
    - Beautiful vintage UI with period-appropriate styling
    - 3D positional audio with distance-based falloff
    - Economy integration and permission systems
    - Anti-tampering security protection
    - Admin commands and controls
    
    © 2026 iBoss | The Land of Wolves | www.wolves.land
    License: MIT
]]

fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'twl_gramaphone'
author 'iBoss | The Land of Wolves'
description 'Immersive phonograph/gramophone system with authentic 1899-era music for RedM'
version '1.0.0'

-- Dependencies
dependencies {
    'ox_lib',
    'xsound'
}

-- Shared files
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared/security.lua',
    'shared/utils.lua',
    'shared/playlists.lua'
}

-- Server files
server_scripts {
    'server/framework.lua',
    'server/main.lua'
}

-- Client files
client_scripts {
    'client/main.lua',
    'client/interaction.lua',
    'client/audio.lua',
    'client/ui.lua'
}

-- UI files
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'locales/en.lua'
}

-- Lua 5.4
lua54 'yes'
