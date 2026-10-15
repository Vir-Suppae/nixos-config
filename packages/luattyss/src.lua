local posix = require"posix"

local chars = {
    "\u{2588}",
    "\u{2593}",
    "\u{2592}",
    "\u{2591}",
}

local fg_colors = {
    "\x1b[30m",
    "\x1b[31m",
    "\x1b[32m",
    "\x1b[33m",
    "\x1b[34m",
    "\x1b[35m",
    "\x1b[36m",
    "\x1b[37m",
    "\x1b[39m",
}

local bg_colors = {
    "\x1b[40m",
    "\x1b[41m",
    "\x1b[42m",
    "\x1b[43m",
    "\x1b[44m",
    "\x1b[45m",
    "\x1b[46m",
    "\x1b[47m",
    "\x1b[49m",
}

os["execute"]"stty -icanon -echo"
io["write"]"\x1b[?25l"
io["flush"]()

math["randomseed"]()

while true do
    local buffer = {}
    buffer[#buffer + 1] = "\x1b[H"
    for _ = 1,(170*48) do
        -- buffer[#buffer + 1] = fg_colors[math.random(1,#fg_colors)] .. bg_colors[math.random(1,#bg_colors)] .. chars[math.random(1,#chars)] 
        buffer[#buffer + 1] = "\x1b[38;5;" .. tostring(math.random(0,255)) .. "m" .. "\x1b[48;5;" .. tostring(math.random(0,255)) .. "m" .. chars[math.random(1,#chars)]
    end
    buffer[#buffer + 1] = "\x1b[0m"
    io["write"](table.concat(buffer))
    io["flush"]()
    if posix["rpoll"](0, 0) == 1 then
        local _  = io["stdin"]["read"](io["stdin"], 1)
        break
    end
end
os["execute"]"stty icanon echo"
io["write"]"\x1b[?25h"
io["flush"]()
