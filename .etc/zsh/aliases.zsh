# Aliases...

alias gs='git status'
alias e='$EDITOR'
alias gitcount='git rev-list HEAD --count'
alias remove_ds_store="find . -name '*.DS_Store' -type f -delete"
alias remove_console_log="sed -i '' '/console.log(.*)/d' */**.ts"
alias uuid="uuidgen"
alias dc=docker-compose
alias commit="cd ~/Documents/git-commit-dir && git commit &> /dev/null || true && cd -"

ggpf () {
        local b="$(git_current_branch)"
        git push origin "${b:=$1}" --force
}
