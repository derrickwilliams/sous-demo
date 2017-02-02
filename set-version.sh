#! /usr/bin/env bash
set -ex

if [ $# -lt 1 ]; then
  echo "Usage: $0 <version> [text]"
  exit 1
fi

customtext=$1
if [ $# -ge 2 ]; then
  customtext=$2
fi

echo "$customtext" > customstring
git commit --no-gpg-sign -am "Updating version to $1"
git tag "$1"
git push
git push --tags
