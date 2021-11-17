#!/usr/bin/env bash

set -x

while getopts f:o:s: flag -u
do
    case "${flag}" in
        f) ASCIIDOC_FILE=${OPTARG};;
        o) TERRAFORM_ARGS=${OPTARG};;
        s) TERRAFORM_SOURCE=${OPTARG};;
        *) echo "Unsupported option provided."
           exit 1;;
    esac
done

ASCIIDOC_FILE=${ASCIIDOC_FILE:-file1.adoc}
TERRAFORM_ARGS="${TERRAFORM_ARGS:---indent 3}"
TERRAFORM_SOURCE="${TERRAFORM_SOURCE:-src}"

tmp_file_tfdoc=$(mktemp "${TMPDIR:-/tmp}/terraform-docs-XXXXXXXXXX")
tmp_file_asciidoc=$(mktemp "${TMPDIR:-/tmp}/terraform-docs-XXXXXXXXXX")
terraform-docs asciidoc table ${TERRAFORM_ARGS} ${TERRAFORM_SOURCE} > $tmp_file_tfdoc

perl -pe '
  $repl //= do{local $/;<STDIN>;};
  next unless my $e = /\/\/ BEGIN TERRAFORM ASCIIDOC/.../\/\/ END TERRAFORM ASCIIDOC/;
  $_ = $e =~ /E0/ ? $repl.$_
     : $e == 1 ? $_
     : s/.*//sr;
' ${ASCIIDOC_FILE} < ${tmp_file_tfdoc} > $tmp_file_asciidoc

ASCIIDOC_DIFF=$(diff ${ASCIIDOC_FILE} $tmp_file_asciidoc >/dev/null;echo $?)
if [[ $ASCIIDOC_DIFF -eq 1 ]]
    then    cp -p $tmp_file_asciidoc ${ASCIIDOC_FILE}
fi

rm -f $tmp_file_tfdoc $tmp_file_asciidoc
exit 1
