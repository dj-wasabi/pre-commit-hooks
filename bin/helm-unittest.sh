#!/usr/bin/env bash

set -e
export PATH=$PATH:/usr/local/bin

if which helm &> /dev/null $? != 0 ; then
    echo "HELM must be installed"
    exit 1
fi

helm unittest .
