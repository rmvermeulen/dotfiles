function smart_bun() {
    if [[ $(realpath $(pwd)) == '/mnt/data'* ]]
    then
        bun --backend=copyfile $*
    else
        bun $*
    fi
}

alias b=smart_bun
alias bi='smart_bun i'
alias big='smart_bun i -g'
alias ba='smart_bun a'
alias bad='smart_bun a -d'
alias br='bun run'

echo bun.sh aliases ✔
