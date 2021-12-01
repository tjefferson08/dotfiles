export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HOMEBREW_GITHUB_API_TOKEN=23f6fedb6af8655580a9c466eab780c2dbb79c67
export PATH="$PATH:./node_modules/.bin"
export RBENV_ROOT=/usr/local/var/rbenv
export EDITOR="emacsclient -c"
export ERL_AFLAGS="-kernel shell_history enabled"
export DEBUG_PRINT_LIMIT=20000

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/travis/google-cloud-sdk/path.bash.inc' ]; then source '/Users/travis/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/travis/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/travis/google-cloud-sdk/completion.bash.inc'; fi

if [ -f "$HOME/git-completion.bash" ]; then source "$HOME/git-completion.bash"; fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# source /usr/local/etc/bash_completion
# source <(kubectl completion bash)
eval "$(rbenv init -)"

alias gup='git pull && git submodule update --init'
alias rkdbm='rake db:migrate db:test:prepare'
alias spacemacs='HOME=~/spacemacs open -a /Applications/Emacs.app/'

if [ -f $(brew --prefix asdf)/asdf.sh ]; then
    . $(brew --prefix asdf)/asdf.sh
fi


export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$(yarn global bin)"

# requires fzf
alias coauth='printf "Co-authored-by: %s" "$(git log --pretty=format:"%an <%ae>" -1000 | sort | uniq | fzf)" | pbcopy'

alias flushdns="sudo dscacheutil -flushcache"
alias plan="terraform plan -out=.terraform/plan"
alias apply="terraform apply .terraform/plan"

# 13:35 $ brew install gnu-sed
# ==> Downloading https://homebrew.bintray.com/bottles/gnu-sed-4.8.catalina.bottle.tar.gz
# ==> Downloading from https://d29vzk4ow07wi7.cloudfront.net/726be75d6d7155820b408a10e5c1a5ba1406374a7fc167
# ######################################################################## 100.0%
# ==> Pouring gnu-sed-4.8.catalina.bottle.tar.gz
# ==> Caveats
# GNU "sed" has been installed as "gsed".
# If you need to use it as "sed", you can add a "gnubin" directory
# to your PATH from your bashrc like:
# PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# export PATH="$HOME/.poetry/bin:$PATH"
l
export PATH="$HOME/.poetry/bin:$PATH"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# if [ -f "$HOME/workspace/bin/profile" ]; then source "$HOME/workspace/bin/profile" ; fi

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
if [ -e /Users/travis/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/travis/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
