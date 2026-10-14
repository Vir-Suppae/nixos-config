local posix = require"posix"

local chars = {
    "\u{2588}",
    "\u{2593}",
    "\u{2592}",
    "\u{2591}",
    "\u{0020}",
}

os["execute"]"stty -icanon -echo"
io["write"]"\x1b[?25l"
io["flush"]()

math["randomseed"](0)

while true do
    io["write"]"\x1b[H"
    for _ = 1,(170*48) do
        io["write"](chars[math.random(1,#chars)])
    end
    io["flush"]()
    if posix["rpoll"](0, 0) == 1 then
        local _  = io["stdin"]["read"](io["stdin"], 1)
        break
    end
end
os["execute"]"stty icanon echo"
io["write"]"\x1b[?25h"
io["flush"]()
