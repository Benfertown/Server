-- made with 💓 by SAHIL#8908
lua54 'on'
escrow_ignore {
	'config.lua',
	'server/database.lua'
}

fx_version 'cerulean'
games { 'gta5' }
author 'SAHIL#8908'
description 'A NUI based music / boombox script.'
version '2.0.0'

ui_page 'html/index.html'

client_scripts {
	'config.lua',
	'client/main.lua',
}

files {
	'html/index.html',
	'html/script.js',
	'html/style.css',
}

server_scripts {
	'config.lua',
	'server/main.lua',
	'server/database.lua',
	'@mysql-async/lib/MySQL.lua'
}

dependency '/assetpacks'