cd $"($env.HOME)/.password-store/"
let files = ls **/*.gpg
let files = $files | update name { str substring 0..-5 }
let file = echo $files | get name | to text | fzf -e

let pass_out = pass $file | collect | split row "\n"
$pass_out.0 | wl-copy

print $pass_out

print $file
