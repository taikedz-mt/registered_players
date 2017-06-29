pregistry.api = {}

local servertoken = minetest.setting_get("registry.token")

if not servertoken then
	mineetst.log("error", "You have activated registered_players without specifying your server token !")
	os.exit()
end

local httpapi = nil

-- ===== SECURITY ======

local ie = minetest.request_insecure_environment()

if not ie then
	error("Could not get secure environment. Add babelfish to secure.trusted_mods ")
end

local sandboxed_require = require
require = ie.require -- override require so that system libraries being loaded can benefit

	local httpapi = minetest.request_http_api()
	local json = require("json")

	--
	-- Do any extra Lua library inclusions HERE
	-- Also include any lua that imiport external libs
	--

require = sandboxed_require -- restore

-- =====================

local function errobj(message, data)
	return {err = message, baddata = data}
end

-- Generic web handlers

local function httpsane(value)
	-- We need a proper escaping mechanism
	-- for now just invalidate the user's input
	if not value then return errobj('Value is nil', '') end

	if string.match(value, '[a-zA-Z0-9]+') ~= nil then
		return errobj('Invalid token piece', value)
	end
	return value
end

local function querypair(k, v)
	k = httpsane(k)
	v = httpsane(v)
	
	if k.err or v.err then return errobj('Isssue with k or v', {k = k.err, v = v.err}) end

	return k..'='..v
end

local function webcall(method, params, responsehandle)
	local querystring = ''
	local postdata = nil

	for k,v in pairs(params) do
		local qtoken = querypair(k,v)
		
		if qtoken.err then return qtoken end

		querystring = querystring..'&'..qtoken
	end

	if method == 'post' then
		postdata = querystring
		querystring = ''
	else
		querystring = '?'..querystring
	end

	httpapi.fetch({
		url = pregistry.registry_url..querystring, post_data = postdata
		},
		function(htresponse)
			if not htresponse.succeeded then return errobj(htresponse.message, querystring) end

			local jsontable = json.decode( htresponse.data )

			responsehandle(jsontable)
		end
	)
end


function pregistry.api:registerban(playername)
	webcall('post',
	{},
	function(jsontable)
	-- TODO
	end)
end

function pregistry.api:registerunban(playername)
	webcall('post',
	{},
	function(jsontable)
	-- TODO
	end)
end

function pregistry.api:queryban(playername, servername)
	webcall('post',
	{},
	function(jsontable)
	-- TODO
	end)
end
