# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ys"

export EDITOR='vim'
export TERM=xterm-256color

alias gs='git status'
alias e='$EDITOR'
alias gitcount='git rev-list HEAD --count'
alias remove_ds_store="find . -name '*.DS_Store' -type f -delete"
alias remove_console_log="sed -i '' '/console.log(.*)/d' */**.ts"
alias uuid="uuidgen"
alias dc=docker-compose
alias commit="cd ~/Documents/git-commit-dir && git commit &> /dev/null || true && cd -"

jformat() {
    java -jar ~/.bin/google-java-format-1.6-all-deps.jar --replace **/*.java
}

# Beeps are annoying
setopt NO_BEEP

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/{bin,sbin}:$PATH

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
/usr/bin/ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.pyenv/bin/activate
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
