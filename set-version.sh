#! /usr/bin/env bash
set -ex

if [ $# -lt 1 ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

echo "$1" > customstring
git commit -am "Updating version to $1"
git tag "$1"
git push
git push --tags
