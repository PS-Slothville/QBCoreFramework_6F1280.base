fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Itemized showing badge'
version '1.0.0'

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua',
}

ui_page 'html/index.html'

files {
	'html/*',
}