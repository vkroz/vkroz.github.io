#!/usr/bin/env bash
#--------------------------
set -e

echo "Building site docs..."

PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

cd ${PROJ_DIR}
bundle exec jekyll serve

