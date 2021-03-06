#!/usr/bin/env bash
# Will pretty print YAML files.

if which yamlfmt &> /dev/null $? != 0 ; then
    echo "yamlfmt must be installed: pip install yamlfmt"
    exit 1
fi

EXIT_CODE=0

for file in $@; do
  yamlfmt ${file} -w
  if [[ $? -ne 0 ]]
    then  EXIT_CODE=1
          echo $file
  fi
done
exit $EXIT_CODE
