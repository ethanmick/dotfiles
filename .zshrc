# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=90
ZSH_THEME="ys"

plugins=(git golang)
source $ZSH/oh-my-zsh.sh

source ~/.etc/zsh/aliases.zsh 

for f in $(find "$HOME/.etc/zsh/functions" -type f); do
  source $f
done

export EDITOR='vim'
export TERM=xterm-256color


# Beeps are annoying
setopt NO_BEEP

# Customize to your needs...
export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/{bin,sbin}:$PATH

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
/usr/bin/ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1

source ~/.pyenv/bin/activate
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load NVM
source $(brew --prefix nvm)/nvm.sh

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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
# added by travis gem
[ -f /Users/ethan/.travis/travis.sh ] && source /Users/ethan/.travis/travis.sh
