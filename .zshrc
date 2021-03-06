# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rasmus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
DISABLE_UPDATE_PROMPT=true
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# nvm stuff (load before aliases for global packages)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 2>/dev/null # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use default;

# deno stuf
export DENO_INSTALL="/home/rasmus/.local"
export PATH="$DENO_INSTALL/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vscode shorthand
alias c=codium

# mardown viewer (unfinished)
alias md=~/Projects/mandown/mandown

# git stuff
alias g=git
alias ge='git extras'
alias gg='g go'

echo git aliases ✔

# find file by name
function findFile () {
  if [[ $# -lt 1 ]] then;
    return;
  fi;
  iname=$1
  target=${2:-.}
  find $target -not -path "*node_modules*" -iname "*$iname*" -type f;
}
alias ff=findFile
# find file by name
function findDir () {
  if [[ $# -lt 1 ]] then;
    return;
  fi;
  iname=$1
  target=${2:-.}
  find $target -not -path "*node_modules*" -iname "*$iname*" -type d;
}
alias fd=findDir

echo find aliases ✔

# find brew
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"


# make yarn usable
if type yarn 2>/dev/null; then
  # add yarn global bin to path
  yarnbin=$(yarn global bin);
  if [[ ":$PATH:" != *":$yarnbin:"* ]]; then
    PATH="$yarnbin:${PATH}";
  fi

  # install packages, if possible with @types
  # > yarnTypes pack1 pack2 ...packages
  function yarnTypes () {
    types=()
    for package in $*; do 
      yarn add $package;
      (yarn add --dev "@types/$package" || return true);
    done
  }

  # install packages, if possible with @types
  # both as devDependencies
  function yarnTypesDev () {
    types=()
    for package in $*; do 
      yarn add $package --dev;
      (yarn add --dev "@types/$package" || return true);
    done
  }


  alias y=yarn

  alias ya='y add'
  alias yad='ya --dev'
  alias yat='yarnTypes $*'
  alias yatd='yarnTypesDev $*'
  alias yadt='yarnTypesDev $*'
  alias yrm='y remove'

  alias yg='y global'
  alias yga='yg add'
  alias ygrm='yg remove'
  
  alias yy='y why'
  alias yp="y --pure-lockfile"
  alias yfr="y --frozen-lockfile"
  alias yt='y test'
  alias ytw='y test --watch'
  alias yf='y --force'
  alias yw='y workspace'
  alias ylp='y list --pattern'


  echo yarn stuff ✔
fi

# have to set up again, can use custom resolvers!
if type pnpm 2>/dev/null; then
  alias p=pnpm
  alias pi='pnpm i'
  alias pig='pnpm i -g'
  alias pid='pnpm i -D'

  alias pri="pnpm recursive install"
  alias prl="pnpm recursive link"

  alias prm='pnpm rm'
  alias prmg='pnpm rm -g'
  
  alias pr='pnpm run'
  alias px='pnpx'

  echo pnpm aliases ✔
fi

# cache rust build using sccache
export RUSTC_WRAPPER=sccache

echo rust stuff ✔


alias xc='xargs code'
# open matched files from an ag query in code
function agcode () {
  files=$(ag -l $*);
  if [ -z $files ]; then
    echo 'No files found!'
  else
    echo $files
    echo $files | xc
  fi
}
alias agc=agcode

# tilix fix
if [[ $TILIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi



# write a jq command safely to same file it's reading from
function jqwrite () {
  jq $1 $2 | sponge $2
}
alias jqw=jqwrite

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
###-begin-ng-completion###
#

# ng command completion script
#   This command supports 3 cases.
#   1. (Default case) It prints a common completion initialisation for both Bash and Zsh.
#      It is the result of either calling "ng completion" or "ng completion -a".
#   2. Produce Bash-only completion: "ng completion -b" or "ng completion --bash".
#   3. Produce Zsh-only completion: "ng completion -z" or "ng completion --zsh".
#
# Usage: . <(ng completion --bash) # place it appropriately in .bashrc or
#        . <(ng completion --zsh) # find a spot for it in .zshrc
#
_ng_completion () {
  local words cword opts
  read -Ac words
  read -cn cword
  let cword-=1

  case $words[cword] in
    ng|help) opts="--version -v b build completion doc e e2e eject g generate get help l lint n new s serve server set t test update v version xi18n" ;;
   b|build) opts="--aot --app --base-href --build-optimizer --bundle-dependencies --common-chunk --delete-output-path --deploy-url --environment --extract-css --extract-licenses --i18n-file --i18n-format --locale --missing-translation --named-chunks --output-hashing --output-path --poll --preserve-symlinks --progress --service-worker --show-circular-dependencies --skip-app-shell --sourcemaps --stats-json --subresource-integrity --target --vendor-chunk --verbose --watch -a -aot -bh -buildOptimizer -bundleDependencies -cc -d -dop -e -ec -extractLicenses -i18nFile -i18nFormat -locale -missingTranslation -nc -oh -op -poll -pr -preserveSymlinks -scd -skipAppShell -sm -sri -statsJson -sw -t -v -vc -w" ;;
   completion) opts="--all --bash --zsh -a -b -z" ;;
   doc) opts="--search -s" ;;
   e|e2e) opts="--aot --app --base-href --build-optimizer --bundle-dependencies --common-chunk --config --delete-output-path --deploy-url --disable-host-check --element-explorer --environment --extract-css --extract-licenses --hmr --host --i18n-file --i18n-format --live-reload --locale --missing-translation --named-chunks --open --output-hashing --output-path --poll --port --preserve-symlinks --progress --proxy-config --public-host --serve --serve-path --service-worker --show-circular-dependencies --skip-app-shell --sourcemaps --specs --ssl --ssl-cert --ssl-key --subresource-integrity --suite --target --vendor-chunk --verbose --watch --webdriver-update -H -a -aot -bh -buildOptimizer -bundleDependencies -c -cc -d -disableHostCheck -dop -e -ec -ee -extractLicenses -hmr -i18nFile -i18nFormat -live-reload-client -locale -lr -missingTranslation -nc -o -oh -op -p -pc -poll -pr -preserveSymlinks -s -scd -servePath -skipAppShell -sm -sp -sri -ssl -sslCert -sslKey -su -sw -t -v -vc -w -wu" ;;
   eject) opts="--aot --app --base-href --build-optimizer --bundle-dependencies --common-chunk --delete-output-path --deploy-url --environment --extract-css --extract-licenses --force --i18n-file --i18n-format --locale --missing-translation --named-chunks --output-hashing --output-path --poll --preserve-symlinks --progress --service-worker --show-circular-dependencies --skip-app-shell --sourcemaps --subresource-integrity --target --vendor-chunk --verbose --watch -a -aot -bh -buildOptimizer -bundleDependencies -cc -d -dop -e -ec -extractLicenses -force -i18nFile -i18nFormat -locale -missingTranslation -nc -oh -op -poll -pr -preserveSymlinks -scd -skipAppShell -sm -sri -sw -t -v -vc -w" ;;
   g|generate) opts="--app --collection --dry-run --force --lint-fix -a -c -d -f -lf" ;;
   get) opts="--global -global" ;;
   help) opts="--short -s" ;;
   l|lint) opts="--fix --force --format --type-check -fix -force -t -typeCheck" ;;
   n|new) opts="--collection --dry-run --verbose -c -d -v" ;;
   s|serve|server) opts="--aot --app --base-href --build-optimizer --bundle-dependencies --common-chunk --delete-output-path --deploy-url --disable-host-check --environment --extract-css --extract-licenses --hmr --host --i18n-file --i18n-format --live-reload --locale --missing-translation --named-chunks --open --output-hashing --output-path --poll --port --preserve-symlinks --progress --proxy-config --public-host --serve-path --service-worker --show-circular-dependencies --skip-app-shell --sourcemaps --ssl --ssl-cert --ssl-key --subresource-integrity --target --vendor-chunk --verbose --watch -H -a -aot -bh -buildOptimizer -bundleDependencies -cc -d -disableHostCheck -dop -e -ec -extractLicenses -hmr -i18nFile -i18nFormat -live-reload-client -locale -lr -missingTranslation -nc -o -oh -op -p -pc -poll -pr -preserveSymlinks -scd -servePath -skipAppShell -sm -sri -ssl -sslCert -sslKey -sw -t -v -vc -w" ;;
   set) opts="--global -g" ;;
   t|test) opts="--app --browsers --code-coverage --colors --config --environment --log-level --poll --port --preserve-symlinks --progress --reporters --single-run --sourcemaps --watch -a -browsers -c -cc -colors -e -logLevel -poll -port -preserveSymlinks -progress -reporters -sm -sr -w" ;;
   update) opts="--dry-run --next -d -next" ;;
   xi18n) opts="--app --i18n-format --locale --out-file --output-path --progress --verbose -a -f -l -of -op -progress -verbose" ;;
   *) opts="" ;;
  esac

  setopt shwordsplit
  reply=($opts)
  unset shwordsplit
}

compctl -K _ng_completion ng
###-end-ng-completion###

# load after the other stuff so we can `cd` if we need to
# call 'nvm use' whenever entering a dir with a .nvmrc
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# echo nvm auto-loader ✔
# if [[ $(pwd) = ~ ]]; then
#   cd ~/Projects
# fi
echo zshrc complete ✔
