# Bash completion for rebide
# Source this file or add to /etc/bash_completion.d/

_rebide() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local commands="serve close dump_db restore_db dump_env restore_env version list-profiles help"
    local options="--skip-docker"

    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=($(compgen -W "${commands} ${options}" -- "${cur}"))
    elif [[ ${COMP_CWORD} -eq 2 ]]; then
        local prev="${COMP_WORDS[1]}"
        case "$prev" in
            serve|close|--skip-docker)
                COMPREPLY=($(compgen -W "--skip-docker" -- "${cur}"))
                ;;
            restore_db)
                # Complete with .sql files from DUMPS_DIR
                local dumps_dir="$HOME/workspace/dumps"
                if [[ -d "$dumps_dir" ]]; then
                    COMPREPLY=($(compgen -f -X '!*.sql' -- "$dumps_dir/"))
                fi
                ;;
            restore_env)
                # Complete with env files from ENVS_DIR
                local envs_dir="$HOME/workspace/envs"
                local project_name=$(basename "$PWD")
                if [[ -d "$envs_dir" ]]; then
                    COMPREPLY=($(compgen -f -- "$envs_dir/env-${project_name}-"))
                fi
                ;;
        esac
    fi
}

complete -F _rebide rebide
