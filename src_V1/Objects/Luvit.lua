--[[spec]]
---@class Luvit
---@field path string
---@field install fun(name: string): Luvit

--[[code]]

-- pre
---@type Luvit
local Luvit = {}
local Static = require'Static'

local output = Static.os.runBash('test -e "lit"||curl -L https://github.com/luvit/lit/'
	..'raw/master/get-lit.sh | sh;pwd')
	
local lineSplit = Static.string.split(output, '\n')
Luvit.path = lineSplit[#lineSplit - 1]

Luvit.install = function(s)
	local command = ('cd %s;test -e "deps"&&rm -R deps;./lit install %s;')
		:format(
			Luvit.path,
			s
        )
	Static.os.runBash(command)

	return Luvit
end

return Luvit