#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

for DOTFILE in `find ./files -type f`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done
