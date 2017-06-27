pregistry = {}

local path = minetest.get_modpath("registered_players")..'/'

minetest.register_privilege("registrar", "allow running against the registry")
minetest.register_privilege("ban", "allows user to ban/unban players")

local function loadf(filep)
	dofile(path..filep)
end

-- Access to the web API
loadf('webcall.lua')

-- Local data saving and loading functions
loadf('fileh.lua')

-- Commands and action definitions
loadf('actions.lua')
loadf('commands.lua')

-- Formspec(s)
loadf('forms.lua')
loadf('challenge.lua')
