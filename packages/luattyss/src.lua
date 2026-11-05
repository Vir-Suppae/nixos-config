local posix = require"posix"

local chars = {
    "\u{0020}",
    "\u{2588}",
    "\u{2591}",
}

local fg_colors = {2,6,7}
local bg_colors = {0}

os["execute"]"stty -icanon -echo"
io["write"]"\x1b[?25l"
io["flush"]()

math["randomseed"]()

local buffer = {}
buffer[#buffer + 1] = "\x1b[H"
for _ = 1,(170*48) do
    buffer[#buffer + 1]=
    "\x1b[38;5;"..fg_colors[math["random"](1,#fg_colors)].."m"..
    "\x1b[48;5;"..bg_colors[math["random"](1,#bg_colors)].."m"..
    chars[math["random"](1,#chars)]
end
buffer[#buffer + 1] = "\x1b[0m"

while true do
    io["write"](table.concat(buffer))
    io["flush"]()
    if posix["rpoll"](0, 100) == 1 then
        local _  = io["stdin"]["read"](io["stdin"], 1)
        break
    end
end
os["execute"]"stty icanon echo"
io["write"]"\x1b[?25h"
io["flush"]()
