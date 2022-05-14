#!/bin/bash -x
podman build --tag ghcr.io/uor-framework/hugo ./ && clear
podman run -it --rm --name hugo -p 1313:1313 --volume .:/src --security-opt label=disable --pull=never ghcr.io/uor-framework/hugo