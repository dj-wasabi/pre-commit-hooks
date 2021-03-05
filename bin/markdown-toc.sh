#!/usr/bin/env bash

if which md_toc &> /dev/null $? != 0 ; then
    echo "md_toc must be installed: pip install md-toc"
    exit 1
fi
EXIT_CODE=0

for file in $@; do
  md_toc -p github $file
  if [[ $? -ne 0 ]]
    then  EXIT_CODE=1
          echo $file
  fi
done
exit $EXIT_CODE
