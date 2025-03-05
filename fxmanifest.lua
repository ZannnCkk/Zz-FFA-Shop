fx_version "cerulean"
author  'Zann Ganteng'
lua54 'yes'

games {
  "gta5",
}

ui_page 'build/index.html'

shared_scripts {
  'shared/**',
  '@ox_lib/init.lua'
}

client_scripts {
  'client/**'
}

server_scripts {
  'server/**'
}

files {
	'build/index.html',
	'build/**/*',
}

export {
  'shopOpen'
}