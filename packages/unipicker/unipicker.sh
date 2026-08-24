#! /usr/bin/env bash
fuzzel -d -w 120 --font "monospace:size=9" < ./unipicker-database.txt |
  cut -f3 |
  python3 -c "import sys; sys.stdout.write(chr(int(sys.stdin.read().split('\t')[2].strip(), 16)))" |
  wl-copy --type text/plain;charset=utf-8
