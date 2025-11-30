# Bash completion for rebide
# Source this file or add to /etc/bash_completion.d/

_rebide() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local commands="serve close version list-profiles help"
    local options="--skip-docker"

    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=($(compgen -W "${commands} ${options}" -- "${cur}"))
    elif [[ ${COMP_CWORD} -eq 2 ]]; then
        # After a command, only --skip-docker makes sense for serve/close/(none)
        local prev="${COMP_WORDS[1]}"
        case "$prev" in
            serve|close|--skip-docker)
                COMPREPLY=($(compgen -W "--skip-docker" -- "${cur}"))
                ;;
        esac
    fi
}

complete -F _rebide rebide
