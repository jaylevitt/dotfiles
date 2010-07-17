# echo "Running /home/jay/.zshrc..."
# Jay's .zshrc, updated 2009-08-04

# See p112 of "From Bash to Z shell" for zsh startup files, but best choices are:
# ~/.zshrc for interactive shells (options "interactive", "rcs", and "globalrcs" are enabled)
# ~/.zshenv for all shells of mine (option "rcs" is enabled)
# /etc/zshenv for everyone's shell (always run)

# See .zsh.readme.txt for cheat sheet

zmodload zsh/datetime

setopt interactive_comments				# Type # at a prompt for comment (in case I'm pasting)
setopt correct					      				# if command not found
setopt noclobber
setopt no_case_glob
setopt numeric_glob_sort
setopt extended_glob
# TODO: setopt no_multios would make 2>&1 redirects work better.. but I forgot the failcase, so
#       I'm leaving it off till I remember

# Shell command history
setopt share_history
setopt hist_ignore_dups
setopt hist_allow_clobber

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

autoload -U edit-command-line
zle -N edit-command-line

[[ -n $(alias run-help) ]] && unalias run-help
autoload -U run-help
export HELPDIR=~/.zsh-help

ostype=$(uname)
hostname=$(hostname)
if [[ "$hostname" =~ /home.jay.fm/ ]]; then
  jay_home="yes"
fi


files=(`echo ~/.zshrc.d/*`) 
for file in $files ; do
    source $file
done
