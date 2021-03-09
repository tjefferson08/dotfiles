if [[ $TERM = dumb ]]; then return; fi

source ~/.bash/aliases.sh

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function title {
    echo -ne "\033]0;"$*"\007"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/travis/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /Users/travis/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/travis/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /Users/travis/.config/yarn/global/node_modules/tabtab/.completions/sls.bash

if [ -f $(brew --prefix autoenv)/activate.sh ]; then
    . $(brew --prefix autoenv)/activate.sh
fi
