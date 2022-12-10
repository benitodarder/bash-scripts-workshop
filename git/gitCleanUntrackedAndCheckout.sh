#!/bin/bash

echo "Please check script is called within a GIT repository folder..."

set -x

git clean -f -x
git checkout .
