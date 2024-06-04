fx_version 'cerulean'
game 'gta5'
author 'pixeloza'
description 'Job Center'
lua54 'yes'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/script.js'
}