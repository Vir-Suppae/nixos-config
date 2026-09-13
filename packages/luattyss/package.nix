{writeLua}: 
writeLua {
  name = "luattyss";

  text = builtins.readFile ./src.lua;
}
