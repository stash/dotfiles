
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ga='git add'
alias gap='git add -p'
alias gau='git add -u'
alias gci='git commit -v'
alias gcia='git commit -v -a'
alias gciam='git commit -v -a -m'
alias gcim='git commit -v -m'
alias gco='git checkout'
alias gcp='git cherry-pick -x'
alias gd='git diff --word-diff=color'
alias gdc='gd --cached'
alias gdcp='gdc | vim-pager'
alias gdp='gd | vim-pager'
alias gl='git log'
alias glm='git ls-files --exclude-standard -m'
alias glol='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gls='git ls-files --exclude-standard'
alias grep='grep --devices=skip --binary-files=without-match'
alias grh='git reset --hard HEAD'
alias gst='git status'
alias gun='git reset HEAD'
alias gundo='git reset HEAD^'
alias gup='git pull --rebase'
alias guppy='gup && gpu' # gpu defined in .bash_git_cmd
alias la='ls -la'
alias ll='ls -l'
alias myps='eval "ps -fH -u $USER"'
alias profile='source ~/.bashrc'
alias sup='git stash && gup && git stash pop'
alias suppy='git stash && gup && gpu && git stash pop'

alias tmux='tmux -2 -u' # 256-color and utf8

for i in `seq 1 9`; do
  alias "sshT$i"="TERM=xterm-256color ssh -t -A bastion.aws.goinstant.org ssh -t -A deploy-1.aws.goinstant.org ssh test-$i.aws.goinstant.org"
done

alias vi=vim
