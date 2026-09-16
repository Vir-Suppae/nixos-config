{writeLuaBin, pkgs, ...}: 
writeLuaBin "luattyss" {libraries = [pkgs.luaPackages.luaposix];} (builtins.readFile ./src.lua)
