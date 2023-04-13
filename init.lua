require('sillypoise.base')
require('sillypoise.highlights')
require('sillypoise.maps')
require('sillypoise.lazy')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
    require('sillypoise.macos')
end
if is_win then
    require('sillypoise.windows')
end
