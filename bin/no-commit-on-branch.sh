#!/usr/bin/env bash
# Do not allow commits on provided branches.


EXITCODE=0
while getopts b: flag
do
    case "${flag}" in
        b) BRANCHES=${OPTARG};;
        *) echo "Unsupported option provided."
           exit 1;;
    esac
done

for BRANCH in $(echo ${BRANCHES} | sed 's/,/ /g');
    do
        if git rev-parse --abbrev-ref HEAD | grep -e ${BRANCH} > /dev/null 2>&1
            then  echo "You are not allowed to commit on ${BRANCH} branch."
                  EXITCODE=1
        fi
done
exit ${EXITCODE}
