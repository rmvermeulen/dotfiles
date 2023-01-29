
# write a jq command safely to same file it's reading from
function jqwrite () {
  jq $1 $2 | sponge $2
}
alias jqw=jqwrite