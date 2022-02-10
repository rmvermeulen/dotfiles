# cache rust build using sccache
export RUSTC_WRAPPER=sccache

echo rust stuff ✔


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
