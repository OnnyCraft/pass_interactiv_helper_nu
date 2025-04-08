let ls_dirs = ls -s $"($env.HOME)/.password-store/" | get name
let dirs = $ls_dirs | filter {|name| (not ($name | str starts-with '.'))}
let dir = echo $dirs | to text | fzf -e


let ls_files = ls -s $"($env.HOME)/.password-store/($dir)/"
let files = $ls_files | filter {|entry| $entry | get name | str ends-with '.gpg'}
let files = $files | update name { str substring 0..-5 }
let file = echo $files | get name | to text | fzf -e

let path = $"~/.password-store/($dir)/($file).gpg"

let pass = $"($dir)/($file)"
# pass show -c $path

print $pass
