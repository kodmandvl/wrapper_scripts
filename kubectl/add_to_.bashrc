##### PS1 BASH PROMPTS WITH KUBECONFIG #####

# fake KUBECONFIG for begin (if you need):
export KUBECONFIG="$(whoami)@$(hostname)"
export KUBECONFIG="$(hostname)"

# alias for export command:
alias e='export'

# alias for unset KUBECONFIG:
alias ukc='unset KUBECONFIG'

# PS1 bash prompts with KUBECONFIG:
export PS1="\[\e[1;34m\][\$KUBECONFIG]\[\e[1;90m\][\W]$ \[\e[0m\]"
export PS1="\[\e[1;34m\][\$(echo \$KUBECONFIG | sed 's/.*[/]//g' | sed 's/.yaml$//g')]\[\e[0;32m\][\W]$ \[\e[0m\]"
export PS1="\[\e[1;34m\][\$(echo \$KUBECONFIG | sed 's/.*[/]//g' | sed 's/.yaml$//g')]\[\e[0;33m\][\W]$ \[\e[0m\]"
export PS1="\[\e[1;34m\][\$(echo \$KUBECONFIG | sed 's/.*[/]//g' | sed 's/.yaml$//g')]\[\e[0;36m\][\W]$ \[\e[0m\]"
export PS1="\[\e[1;34m\]\$(echo \$KUBECONFIG | sed 's/.*[/]//g' | sed 's/.yaml$//g')\[\e[0;36m\][\h:\W]$ \[\e[0m\]"
export PS1="\[\e[1;34m\]\$(echo \$KUBECONFIG | sed 's/.*[/]//g' | sed 's/.yaml$//g')\[\e[0;36m\][\W]$ \[\e[0m\]"

