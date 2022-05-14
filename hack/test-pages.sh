git submodule update --init --recursive
npm install postcss-cli
HUGO_ENV="production" hugo server command --disableFastRender --bind=0.0.0.0
