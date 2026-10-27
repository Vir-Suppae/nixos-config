{ pkgs, fuzzel, ...}:

let name = "scrap"; in
pkgs.writeTextFile {
  inherit name;
  text = ''
    #!${pkgs.nushell}/bin/nu
    def main [do_slurp: bool = true] {
      let geo = if $do_slurp {
        let rect = (${pkgs.slurp}/bin/slurp | complete)
        if rect.exit_code != 0 {
          print "oh noooo"
          return
        }
        ["-g" $rect.stdout]
      } else {[]}
      print "hmm ok =b"
      let filename = $"~/Pictures/Screenshots/(${fuzzel}/bin/fuzzel -d --prompt-only="name: " --search=$"screenshot.(date now | format date '%Y-%m-%d.%H-%M-%S').png" -w 64 --font "monospace:size=9")"
      print "noice :D"
      ${pkgs.grim}/bin/grim ...$geo ($filename | path expand)
    }
  '';
  executable = true;
  destination = "/bin/${name}";
  meta.mainProgram = name;
}
