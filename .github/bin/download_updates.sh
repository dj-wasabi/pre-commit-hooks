#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOTPATH=${SCRIPTPATH}/../../

for script in $(grep '.sh)' readme.md | awk -F '(' '{print $2}' | awk -F ')' '{print $1}'); do
  _SCRIPT_NAME=$(echo $script | xargs basename)
  curl -so ${ROOTPATH}/bin/${_SCRIPT_NAME} $script
  chmod +x ${ROOTPATH}/bin/${_SCRIPT_NAME}
done