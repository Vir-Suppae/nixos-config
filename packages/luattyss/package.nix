{ pkgs, ... }: 
# pkgs.writers.writeLuaBin "luattyss" {libraries = with pkgs.luaPackages; [luaposix];} (builtins.readFile ./src.lua)
pkgs.writeShellScriptBin "luattyss" ''
  exec ${pkgs.lua5_4.withPackages (ps: [ps.luaposix])}/bin/lua ${./src.lua} "$@"
''
