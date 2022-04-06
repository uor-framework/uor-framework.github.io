#!/bin/bash -ex
git submodule update --init --recursive
npm install postcss-cli
rm -rf public
HUGO_ENV="production" hugo --gc
mv -f public docs
