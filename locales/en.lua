-- 🐺 English Localization
-- www.wolves.land | Created by iBoss

Locale = {}

Locale['en'] = {
    -- General
    ['gramophone'] = 'Gramophone',
    ['press_to_use'] = 'Press ~y~[ALT]~w~ to use Gramophone',
    
    -- Menu
    ['menu_title'] = 'The Gramophone',
    ['menu_subtitle'] = 'Authentic 1899-Era Music Selection',
    ['select_playlist'] = 'Select a Playlist',
    ['select_track'] = 'Select a Track',
    ['now_playing'] = '♪ Now Playing: %s - %s',
    ['track_duration'] = 'Duration: %s',
    
    -- Actions
    ['playing_track'] = 'Playing: %s',
    ['stopped_track'] = 'Music stopped',
    ['all_stopped'] = 'All gramophones stopped',
    
    -- Errors
    ['no_record'] = "You don't have a gramophone record!",
    ['no_money'] = "You don't have enough money! ($%s needed)",
    ['not_owner'] = "You don't own this gramophone!",
    ['invalid_track'] = "Invalid track selection!",
    ['transaction_failed'] = "Transaction failed!",
    
    -- Success
    ['paid_for_song'] = "You paid $%s to play music",
    ['config_reloaded'] = "Configuration will reload on next use",
    
    -- Admin
    ['admin_stopped_all'] = "All gramophones have been stopped by an admin",
    
    -- Info
    ['distance'] = '%s meters away',
    ['volume'] = 'Volume: %s%%',
    ['cost_per_song'] = 'Cost: $%s per song',
    ['free_for_job'] = 'Free for %s',
}

return Locale
