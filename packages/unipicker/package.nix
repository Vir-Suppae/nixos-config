{ writeShellApplication, fuzzel, python314, wl-clipboard }:

writeShellApplication {
  name = "unipicker";

  runtimeInputs = [
    fuzzel
    python314
    wl-clipboard
  ];

  text = ''
    fuzzel -d -w 120 --font "monospace:size=9" < ${./unipicker-database.txt} |
      python3.14 -c "import sys; sys.stdout.write(chr(int(sys.stdin.read().split('\t')[2].strip(), 16)))" |
      wl-copy --type 'text/plain;charset=utf-8'
  '';
}
