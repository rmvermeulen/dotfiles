
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