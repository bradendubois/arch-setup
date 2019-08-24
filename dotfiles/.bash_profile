#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

for DOTFILE in `find ~/.dotfiles/files -type f`
do
  source $DOTFILE
done