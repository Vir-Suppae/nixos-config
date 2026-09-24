{writeLuaBin, pkgs, ...}: 
writeLuaBin "luattyss" {libraries = with pkgs.luaPackages; [luaposix];} (builtins.readFile ./src.lua)
