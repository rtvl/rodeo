#!/bin/bash
STARTING_DIR=$(pwd)
TARGET_DIR=~/Projects/yhat/rodeo

cd $TARGET_DIR

rm -rf dist

#dependencies
./scripts/osx/install-deps.sh

#remember nvm
echo '#remember nvm'
source $(brew --prefix nvm)/nvm.sh
nvm use

# Detect architecture for M1/ARM64 support
ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

if [ "$ARCH" = "arm64" ]; then
  echo "Building for Apple Silicon (M1/M2)..."
  #build distributable for ARM64
  node_modules/.bin/build --osx --arm64
else
  echo "Building for Intel (x64)..."
  #build distributable for x64
  node_modules/.bin/build --osx --x64
fi

#list created files
echo '#list created files:'
git ls-files dist -o -x node_modules --directory

cd $STARTING_DIR
