#!/bin/bash
set -x

democluster=ci
singularity=qa-sf

if [ $# -ge 1 ]; then
  democluster=$1
fi

if [ $# -ge 2 ]; then
  singularity=$2
fi

URL=$(cygnus -x 1 "http://singularity-${singularity}.otenv.com" | grep "sous-demo.*${democluster}" | awk '{ print $3 ":" $4 }' | tail -n 1)
URL="http://$URL"
echo "$URL"

open "$URL"
