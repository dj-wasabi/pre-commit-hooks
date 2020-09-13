#!/usr/bin/env bash

set -e
export PATH=$PATH:/usr/local/bin

helm unittest -3 .
