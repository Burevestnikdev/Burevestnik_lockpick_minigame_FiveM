-- /* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

fx_version 'cerulean'
game 'gta5'
lua54 'yes' 

author "Burevestnik"
description "https://discord.gg/g29v9nSKUE | https://burevestnik.tebex.io/"
version "1.0.0"

client_scripts {
    'client.lua',
}

shared_scripts {
	"config.lua",
}

ui_page {
    'ui/index.html'
}

files {
    'ui/index.html',
    'ui/css/*.css',
    'ui/js/*.js',
    'ui/assets/audio/*.mp3',
    'ui/assets/images/*.png',
}

export {
    'Burevestnik_lockpick_minigame_start',
    'Burevestnik_lockpick_minigame_stop',
}