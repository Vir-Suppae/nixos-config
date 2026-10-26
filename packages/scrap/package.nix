{ pkgs, fuzzel, ...}:

let name = "scrap"; in
pkgs.writeTextFile {
  inherit name;
  text = ''
    #!${pkgs.nushell}/bin/nu
    ${fuzzel} -d --prompt-only="name: " --search=$"screenshot.(date now | format date '%Y-%m-%d.%H-%M-%S').png" -w 64 --font "monospace:size=9"
  '';
  executable = true;
  destination = "/bin/${name}";
  meta.mainProgram = name;
}
