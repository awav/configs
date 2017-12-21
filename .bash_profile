#!/bin/bash

export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;32m\]\$ \[\033[00m\]'
PS1_ANACONDA_ROOT='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;32m\](conda)\$ \[\033[00m\]'

alias ll='ls -la -G'

export ANACONDA="/Users/Artem/anaconda3/bin"
export PATH="${ANACONDA}:$PATH"

function turn_anaconda() {
    case "$1" in
        "on")
            if [[ "${ANACONDA}" != *"${PATH}"* ]]; then
                export PATH="${ANACONDA}:$PATH"
		echo "Anaconda is active"
            fi
            ;;
        "off")
            export PATH=$(echo "$PATH" | sed -e "s,${ANACONDA}:,,g")
            echo "Anaconda is inactive"
            ;;
        *)
            echo "Unknown command. Use 'on' or 'off'."
    esac
}
