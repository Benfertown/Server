fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua'
}

client_script 'client/main.lua'

server_script 'server/main.lua'
server_script 'server/functions.lua'

files {
	'img/*.png'
}

lua54 'yes'

escrow_ignore {
    'config.lua',
    'server/functions.lua'
}
dependency '/assetpacks'