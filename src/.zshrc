# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rasmus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [[ -f /usr/share/instantshell/zshrc ]]; then
  source /usr/share/instantshell/zshrc
  echo "InstantOS zshrc ✔"
fi

### oh my zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/rasmus/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sunrise"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

echo "oh-my-zsh ✔"

# fish like syntax highlighting
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  echo "syntax highlighting ✔"
fi

# setup my dotfiles
DOTFILESDIR=~/dev/dotfiles
DOTFILES_SCRIPTSDIR=~/dev/dotfiles/src/scripts


source $DOTFILES_SCRIPTSDIR/jqwrite.sh
source $DOTFILES_SCRIPTSDIR/misc.sh


# nim/choosenim
export PATH=/home/rasmus/.nimble/bin:$PATH

# register pub path (dart package manager)
export PATH="$PATH":"$HOME/.pub-cache/bin"

# register cargo bin path (rust package manager)
export PATH="$PATH":"$HOME/.cargo/bin"

# register dotnet tools
export PATH="$PATH":"$HOME/.dotnet/tools"

# override codium with code from pacman
alias c=code
alias ci=code-insiders
alias vim=nvim
alias dn=dotnet
alias open=xdg-open


# fix tilix split terminals
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

# setup git, if we use it
if type git &>/dev/null; then
  source $DOTFILES_SCRIPTSDIR/setup-git.sh
fi

# nodejs-related stuff
# fnm - fast nvm

export PATH=/home/rasmus/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
echo "fnm ✔"

# package managers etc
source $DOTFILES_SCRIPTSDIR/setup-node-etc.sh

# pnpm
export PNPM_HOME="/home/rasmus/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Load Angular CLI autocompletion.
source <(ng completion script)

# bun completions
[ -s "/home/rasmus/.bun/_bun" ] && source "/home/rasmus/.bun/_bun"

# Bun
export BUN_INSTALL="/home/rasmus/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
