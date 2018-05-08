export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HOMEBREW_GITHUB_API_TOKEN=23f6fedb6af8655580a9c466eab780c2dbb79c67
export PATH="$PATH:./node_modules/.bin"
export RBENV_ROOT=/usr/local/var/rbenv
export CAPYBARA_CHROME_BINARY="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/travis/google-cloud-sdk/path.bash.inc' ]; then source '/Users/travis/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/travis/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/travis/google-cloud-sdk/completion.bash.inc'; fi

if [ -f "$HOME/git-completion.bash" ]; then source "$HOME/git-completion.bash"; fi

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# source /usr/local/etc/bash_completion
# source <(kubectl completion bash)
eval "$(rbenv init -)"

alias gup='git pull && git submodule update --init'
alias rkdbm='rake db:migrate db:test:prepare'
