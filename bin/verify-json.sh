#!/usr/bin/env bash
# Will pretty print YAML files.

TMP_DIR=$(mktemp -d -t "verify-json-XXXXXXXXXX")
EXIT_CODE=0

for file in $@;
  do  cat $file | python -m json.tool > ${TMP_DIR}/${file}
      if [[ $? -ne 0 ]]
        then  echo $file
              EXIT_CODE=1
              break
      fi
      if [[ $(diff $file ${TMP_DIR}/${file} > /dev/null;echo $?) -ne 0 ]]
        then  cp ${TMP_DIR}/${file} ${file}
              EXIT_CODE=1
      fi
done

rm -rf ${TMP_DIR}
exit ${EXIT_CODE}
