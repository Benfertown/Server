fx_version 'adamant'
game "gta5"

name 'kgv-blackjack'
description 'Playable Blackjack at the casino, similar to GTAOnline.'
author 'Xinerki - https://github.com/Xinerki/'
url 'https://github.com/Xinerki/kgv-blackjack'

shared_scripts {
	'coords.lua',
}

client_scripts{
	'client/*.lua'
} 

server_scripts{
	'server/*.lua'
} 


data_file 'DLC_ITYP_REQUEST' 'stream/cards/vw_prop_vw_cards.ityp'
data_file "PED_METADATA_FILE" "peds.meta"

files{
	"peds.meta",
}