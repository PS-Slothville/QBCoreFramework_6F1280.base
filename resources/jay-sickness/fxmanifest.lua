fx_version 'adamant'

game 'gta5'
lua54 'yes'

shared_scripts {
    -- '@jay-dev-build/sh_init.lua',
    'config.lua',
    'shared/sh_*.lua'
}

client_scripts {
    -- '@jay-dev-build/cl_init.lua',
    'client/cl_*.lua'
}
server_scripts {
    -- '@jay-dev-build/sv_init.lua',
    'server/sv_*.lua'
}