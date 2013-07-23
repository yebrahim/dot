# .bashrc file
# By Yasser Elsayed (yasser.ebrahim@gmail.com)
#
# Concepts:
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#    2) .bash_profile is the *login* config for bash, launched upon first connection.
#    3) .bash_profile imports .bashrc, but not vice versa.
#    4) .bashrc imports .bashrc_custom, which can be used to override
#        variables specified here.
#           

# Make prompt informative
PS1='\e[0;31m\u \w| \e[m'

## -----------------------
## Set up aliases --
## -----------------------

# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll="ls -alrtFC -color"
alias ls="ls -AC"
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias du='du -h -d=1'
alias tree='tree -A -C -L 2'

# 2.3) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

# 2.4) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX

# history:
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

alias open='gnome.open'
