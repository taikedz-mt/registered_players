function tokenize(mystring)
	s={}
	for x in mystring:gmatch("[^%s]+") do
		s[#s+1] = x ; print (#s)
	end
	return s
end


minetest.register_chatcommand('ban', {
	params = '<name>',
	description = '',
	privs = {},
	func = function(playername, cstring)
		local params = tokenize(cstring)

		local res = pregistry:ban(params[1])
		minetest.chat_send_player(playername, res)
	end,
})

minetest.register_chatcommand('unban', {
	params = '<name>',
	description = '',
	privs = {},
	func = function(playername, cstring)
		local params = tokenize(cstring)

		local res = pregistry:unban(params[1])
		minetest.chat_send_player(playername, res)
	end,
})

minetest.register_chatcommand('isbanned', {
	params = '<name>',
	description = '',
	privs = {},
	func = function(playername, cstring)
		local params = tokenize(cstring)

		local res = pregistry:isbanned(params)
		minetest.chat_send_player(playername, res)
	end,
})

minetest.register_chatcommand('banmode', {
	params = '<name>',
	description = '',
	privs = {basic_privs=true},
	func = function(playername, cstring)
		local params = tokenize(cstring)

		local res = pregistry:banmode(params)
		minetest.chat_send_player(playername, res)
	end,
})

minetest.register_chatcommand('getbanmode', {
	params = '<name>',
	description = '',
	privs = {},
	func = function(playername, cstring)
		minetest.chat_send_player(playername, 'Registry ban mode is : '..pregistry.mode)
	end,
})



