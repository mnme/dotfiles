color=base16-monokai.dark.256.xresources
echo "Setting urxvt color to $color"
colordir=$(realpath "${HOME}/.colors")
ln -sv "$colordir/base16-xresources/$color" "$colordir/current" 
