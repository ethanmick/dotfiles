# Setup oh-my-zsh
# Path to your oh-my-zsh configuration.
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=90
ZSH_THEME="ys"
plugins=(git golang kubectl)
source $ZSH/oh-my-zsh.sh

# Fetch custom bash aliases
source ~/.etc/zsh/aliases.zsh 

# Setup custom functions
for f in $(find "$HOME/.etc/zsh/functions" -type f); do
  source $f
done

# Environment
setopt NO_BEEP
export EDITOR='vim'
export TERM=xterm-256color
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$HOME/.bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/{bin,sbin}:$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=/usr/local/opt/node@18/bin:$PATH
export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# Setup environment for current job
for f in $(find "$HOME/.etc/work" -type f); do
  source $f
done

# SSH Key
/usr/bin/ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1

# Activate Python virtual environment
source ~/.pyenv/bin/activate

# Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# open a file for editing by choosing with fzf
fzf-open-file-or-dir() {
    local cmd="command find -L . \
	         \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
	             -o -type f -print \
	                -o -type d -print \
	                     -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
    local out=$(eval $cmd | fzf --exit-0)
    if [ -f "$out" ]; then
        $EDITOR "$out" < /dev/tty
    elif [ -d "$out" ]; then
        cd "$out"
        zle reset-prompt
    fi
}
zle -N fzf-open-file-or-dir
bindkey '^W' fzf-open-file-or-dir

# iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
