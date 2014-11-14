color=base16-monokai.dark.256.xresources
colordir=$(realpath "${HOME}/.colors")
e_header "Setting urxvt color to $color"
skip="$("link_test" "$colordir/current" "$colordir/base16-xresources/$color")"
if [[ "$skip" ]]; then
  e_error "Skipping ~/.colors/current, $skip."
  return 1;
fi 
if [[ -e "$colordir/current" ]] ; then
    # Destination file already exists in ~/.colors Back it up!
    e_arrow "Backing up $colordir/current"
    # create backup directory when it doesn't exist already
    [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
    mv "$colordir/current" "$backup_dir"
    backup=1
fi
ln -sv "$colordir/base16-xresources/$color" "$colordir/current"
