###########
# GENERAL #
###########
alias home='cd ~'
alias ll='ls -lahG'
alias ..='cd ..'
alias ...='cd ../..'
alias docs='cd /home/alex/Dokumente/'
alias st='git status'
alias pull="git pull"
alias push="git push"
alias rebase="git pull --rebase"
alias log='git log --pretty=format:"%Cgreen%ad%Creset: %s%d" --date=local --author=Alex --since="1 weeks ago" --no-merges'


# this will give you a colored bash:
# username: folder [banch*] $
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}
 
#PS1='\[\e[0;36m\]\h: \e[0;32m\]\W\e[0;35m\]$(parse_git_branch)\[\e[m\] $ '
PS1='\[\e[0;36m\]${debian_chroot:+($debian_chroot)}\u@\h: \e[0;32m\W\e[0;35m$(parse_git_branch)\[\e[m\] $ '
