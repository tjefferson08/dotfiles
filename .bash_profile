export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HOMEBREW_GITHUB_API_TOKEN=23f6fedb6af8655580a9c466eab780c2dbb79c67
export PATH="$PATH:./node_modules/.bin"
export RBENV_ROOT=/usr/local/var/rbenv
export CAPYBARA_CHROME_BINARY="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export EDITOR="emacsclient -c"
export ERL_AFLAGS="-kernel shell_history enabled"

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

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# source /usr/local/etc/bash_completion
# source <(kubectl completion bash)
eval "$(rbenv init -)"

alias gup='git pull && git submodule update --init'
alias rkdbm='rake db:migrate db:test:prepare'
alias spacemacs='HOME=~/spacemacs open -a /Applications/Emacs.app/'

if [ -f "$HOME/str_aliases" ]; then source "$HOME/str_aliases"; fi

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

source /usr/local/opt/asdf/asdf.sh

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$(yarn global bin)"

# default java version is 1.8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export MAVEN_REALM='Artifactory Realm'
export MAVEN_HOST='sharethrough.jfrog.io'
export MAVEN_USER='deployer'
export MAVEN_PASSWORD='SroTIGdn9G'
