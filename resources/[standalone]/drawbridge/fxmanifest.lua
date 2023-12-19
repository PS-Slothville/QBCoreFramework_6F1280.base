fx_version 'cerulean'
game 'gta5'

shared_script {
    'config.lua'
}

client_script {
    'client/cl_*.lua'
}

server_script {
    'server/sv_*.lua'
}

ui_page 'html/index.html'


files {
	'html/index.html',
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
	'html/sound/*.ogg',
}
