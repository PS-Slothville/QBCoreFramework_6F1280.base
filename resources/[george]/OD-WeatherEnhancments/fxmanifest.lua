fx_version 'cerulean'
game 'gta5'

author 'Ordinary Developments!'
description 'A Script taking immersion to the next level'
version '1.0'

shared_scripts {
    -- "@ox_lib/init.lua",
    'config.lua',
    '@qb-core/shared/locale.lua',
}

server_script {'server/*.lua'}
client_script {'client/*.lua'}

dependency 'qb-weathersync'

lua54 'yes'