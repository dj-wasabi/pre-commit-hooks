#!/bin/bash

if which hadolint &> /dev/null $? != 0 ; then
    echo "Hadolint must be installed"
    exit 1
fi

hadolint "$@"
exit $?
