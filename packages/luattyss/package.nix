{writeLua}: 
writeLua "luattyss" {
  text = builtins.readFile ./src.lua;
}
