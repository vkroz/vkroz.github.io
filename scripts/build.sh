#!/usr/bin/env bash
#--------------------------
set -e

echo "Building site docs..."

PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# Activate python virtual environment with Sphinx installed
source activate default

# Build all Sphinx docs one by one
cd ${PROJ_DIR}/_source
make html

# Build jekyll website
cd ${PROJ_DIR}
jekyll build

echo "Done"
