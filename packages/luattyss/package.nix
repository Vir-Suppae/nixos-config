{ writeShellScriptBin, lua5_4, ... }: 
writeShellScriptBin "luattyss" ''
  exec ${lua5_4.withPackages (ps: [ps.luaposix])}/bin/lua ${./src.lua} "$@"
''
