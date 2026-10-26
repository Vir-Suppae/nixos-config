local posix = require"posix"

local chars = {
    "\u{0020}",
    "\u{2593}",
    "\u{2592}",
    "\u{2591}",
}

local fg_colors = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
local bg_colors = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}

os["execute"]"stty -icanon -echo"
io["write"]"\x1b[?25l"
io["flush"]()

math["randomseed"]()

while true do
    local buffer = {}
    buffer[#buffer + 1] = "\x1b[H"
    for _ = 1,(170*48) do
        buffer[#buffer + 1]=
        "\x1b[38;5;"..fg_colors[math["random"](1,#fg_colors)].."m"..
        "\x1b[48;5;"..bg_colors[math["random"](1,#bg_colors)].."m"..
        chars[math["random"](1,#chars)]
    end
    buffer[#buffer + 1] = "\x1b[0m"
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
