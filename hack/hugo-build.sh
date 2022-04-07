#!/bin/bash -ex
git submodule update --init --recursive
npm install postcss-cli
#rm -rf docs public
HUGO_ENV="production" hugo --gc --cleanDestinationDir --enableGitInfo --destination docs
#mv public docs
