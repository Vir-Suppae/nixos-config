{ pkgs, fuzzel, ...}:

let name = "scrap"; in
pkgs.writeTextFile {
  inherit name;
  text = ''
    #!${pkgs.nushell}/bin/nu
    let rect = slurp
    if $env.LAST_EXIT_CODE != 0 {
      return
    }
    let filename = ${fuzzel}/bin/fuzzel -d --prompt-only="name: " --search=$"screenshot.(date now | format date '%Y-%m-%d.%H-%M-%S').png" -w 64 --font "monospace:size=9"
    grim -g $rect $filename
  '';
  executable = true;
  destination = "/bin/${name}";
  meta.mainProgram = name;
}
