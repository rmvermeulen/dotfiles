# node stuff

# setup swpm, if we use it
if type swpm &>/dev/null; then
    source $DOTFILES_SCRIPTSDIR/node/setup-swpm.sh
else
    # setup yarn, if we use it
    if type yarn &>/dev/null; then
        source $DOTFILES_SCRIPTSDIR/node/setup-yarn.sh
    fi

    # setup pnpm, if we use it
    if type pnpm &>/dev/null; then
        source $DOTFILES_SCRIPTSDIR/node/setup-pnpm.sh
    fi

    # setup bun.sh, if we use it
    if type bun &>/dev/null; then
        source $DOTFILES_SCRIPTSDIR/node/setup-bun.sh
    fi
fi

echo node package manager ✔