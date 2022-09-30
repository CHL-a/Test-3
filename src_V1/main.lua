--run code below
local Static = require('Static')


local WebServer = require('WebServer')
	.new(nil, 3000)
-- local cURL = require('cURL')
local DiscordBot = require('DiscordBot')

local Bot = DiscordBot.new()



WebServer.onRequest('/', 'GET', function (_, _, res)
	res.statusCode = 200
	res.statusMessage = 'OK'
	res.headers.connection = 'close'
	res.body = 'Main page'
end).onInvalidRequest(function (_, req, res)
	res.statusCode = 404
	res.statusMessage = 'found none'
	res.headers.connection = 'close'
	res.body = 'found none'

	print(
		Static.table.toString(req)
	)

end).launch()
	-- .keepAlive('https://test-3',"https://paste.ee/r/UjfWy/0", 'foo')