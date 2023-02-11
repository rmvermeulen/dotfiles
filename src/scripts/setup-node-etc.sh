# node stuff

did_swpm=false
did_yarn=false
did_pnpm=false
did_bun=false
# need to repeat since one of these might be installing the others
for i in {0..1}
do
    # setup swpm, if we use it
    if type swpm &>/dev/null; then
        if [ "$did_swpm" != true ]; then
            did_swpm=true
            source $DOTFILES_SCRIPTSDIR/node/setup-swpm.sh
        fi
    fi

    # setup yarn, if we use it
    if type yarn &>/dev/null; then
        if [ "$did_yarn" != true ]; then
            did_yarn=true
            source $DOTFILES_SCRIPTSDIR/node/setup-yarn.sh
        fi
    fi

    # setup pnpm, if we use it
    if type pnpm &>/dev/null; then
        if [ "$did_pnpm" != true ]; then
            did_pnpm=true
            source $DOTFILES_SCRIPTSDIR/node/setup-pnpm.sh
        fi
    fi

    # setup bun.sh, if we use it
    if type bun &>/dev/null; then
        if [ "$did_bun" != true ]; then
            did_bun=true
            source $DOTFILES_SCRIPTSDIR/node/setup-bun.sh
        fi
    fi
done

echo "node package manager(s) ✔"