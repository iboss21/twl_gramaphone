// 🐺 The Land of Wolves - Gramophone UI Script
// www.wolves.land | Created by iBoss

let currentGramophone = null;
let playlists = [];
let config = {};

// ════════════════════════════════════════════════════════════════
//  MESSAGE HANDLER
// ════════════════════════════════════════════════════════════════

window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openMenu':
            openMenu(data.gramophone, data.playlists, data.config);
            break;
        case 'closeMenu':
            closeMenu();
            break;
        case 'updatePlaylists':
            updatePlaylists(data.playlists);
            break;
        case 'updateConfig':
            updateConfig(data.config);
            break;
    }
});

// ════════════════════════════════════════════════════════════════
//  MENU FUNCTIONS
// ════════════════════════════════════════════════════════════════

function openMenu(gramophone, playlistsData, configData) {
    currentGramophone = gramophone;
    playlists = playlistsData;
    config = configData;
    
    // Show menu
    $('#gramophone-menu').removeClass('hidden');
    
    // Render playlists
    renderPlaylists();
}

function closeMenu() {
    $('#gramophone-menu').addClass('hidden');
    currentGramophone = null;
    
    // Send close callback to client
    $.post('https://twl_gramaphone/closeMenu', JSON.stringify({}));
}

function updatePlaylists(playlistsData) {
    playlists = playlistsData;
    renderPlaylists();
}

function updateConfig(configData) {
    config = configData;
}

// ════════════════════════════════════════════════════════════════
//  RENDERING
// ════════════════════════════════════════════════════════════════

function renderPlaylists() {
    const container = $('#playlists-container');
    container.empty();
    
    if (!playlists || playlists.length === 0) {
        container.html('<div class="loading">Loading playlists</div>');
        return;
    }
    
    playlists.forEach((playlist, playlistIndex) => {
        const playlistSection = $('<div>').addClass('playlist-section');
        
        // Playlist header
        const playlistHeader = $('<div>').addClass('playlist-header');
        const playlistIcon = $('<div>').addClass('playlist-icon').text(playlist.icon || '🎵');
        const playlistInfo = $('<div>').addClass('playlist-info');
        const playlistName = $('<div>').addClass('playlist-name').text(playlist.name);
        const playlistDesc = $('<div>').addClass('playlist-description').text(playlist.description);
        
        playlistInfo.append(playlistName, playlistDesc);
        playlistHeader.append(playlistIcon, playlistInfo);
        playlistSection.append(playlistHeader);
        
        // Tracks list
        if (playlist.tracks && playlist.tracks.length > 0) {
            const tracksList = $('<div>').addClass('tracks-list');
            
            playlist.tracks.forEach((track, trackIndex) => {
                const trackItem = $('<div>')
                    .addClass('track-item')
                    .attr('data-playlist-id', playlist.id)
                    .attr('data-track-index', trackIndex + 1)
                    .click(function() {
                        playTrack(playlist.id, trackIndex + 1, track);
                    });
                
                const trackTitle = $('<div>').addClass('track-title').text(track.title);
                const trackArtist = $('<div>').addClass('track-artist').text(track.artist);
                
                trackItem.append(trackTitle, trackArtist);
                
                // Add duration if available
                if (track.duration) {
                    const duration = formatDuration(track.duration);
                    const trackDuration = $('<div>').addClass('track-duration').text('Duration: ' + duration);
                    trackItem.append(trackDuration);
                }
                
                // Add cost indicator if enabled
                if (config.enableCost) {
                    const costIndicator = $('<div>')
                        .addClass('cost-indicator')
                        .text('$' + config.costPerSong);
                    trackItem.append(costIndicator);
                }
                
                tracksList.append(trackItem);
            });
            
            playlistSection.append(tracksList);
        }
        
        container.append(playlistSection);
    });
}

// ════════════════════════════════════════════════════════════════
//  ACTIONS
// ════════════════════════════════════════════════════════════════

function playTrack(playlistId, trackIndex, track) {
    console.log('Playing track:', playlistId, trackIndex, track.title);
    
    // Send to client
    $.post('https://twl_gramaphone/playTrack', JSON.stringify({
        gramophoneNetId: currentGramophone.netId,
        playlistId: playlistId,
        trackIndex: trackIndex
    }));
}

function stopTrack() {
    console.log('Stopping track');
    
    // Send to client
    $.post('https://twl_gramaphone/stopTrack', JSON.stringify({
        gramophoneNetId: currentGramophone.netId
    }));
}

// ════════════════════════════════════════════════════════════════
//  UTILITY FUNCTIONS
// ════════════════════════════════════════════════════════════════

function formatDuration(seconds) {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return mins + ':' + (secs < 10 ? '0' : '') + secs;
}

// ════════════════════════════════════════════════════════════════
//  KEYBOARD EVENTS
// ════════════════════════════════════════════════════════════════

$(document).keyup(function(e) {
    if (e.key === "Escape" || e.key === "Backspace") {
        if (!$('#gramophone-menu').hasClass('hidden')) {
            closeMenu();
        }
    }
});

// ════════════════════════════════════════════════════════════════
//  INITIALIZATION
// ════════════════════════════════════════════════════════════════

$(document).ready(function() {
    console.log('TWL Gramophone UI initialized');
    
    // Hide menu by default
    $('#gramophone-menu').addClass('hidden');
});
