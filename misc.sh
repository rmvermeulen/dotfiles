# cache rust build using sccache
export RUSTC_WRAPPER=sccache

echo "rust build caching ✔"


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

echo "findFile/ff findDir/fd ✔"
