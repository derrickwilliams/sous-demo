#!/bin/bash
set -x

URL=$(cygnus -x 1 http://singularity-qa-sf.otenv.com | grep 'sous-demo.*ci' | awk '{ print $3 ":" $4 }')
URL="http://$URL"
echo $URL

open $URL
