# With Podman (recommended)
# podman build --tag ghcr.io/uor-framework/hugo ./
# podman run -it --rm --name hugo -p 1313:1313 --volume .:/src --security-opt label=disable --pull=never ghcr.io/uor-framework/hugo
#
# With Docker (slow)
# docker buildx build --file Containerfile --tag docker.io/kong/hugo:local ./
# docker run -it --rm --name hugo --publish 1313:1313 --volume .:/src --security-opt label=disable hugo

FROM quay.io/fedora/fedora:latest AS hugo-builder

ENV ROOTFS_PATH="/rootfs"
ENV DNF_FLAGS="\
  --setopt install_weak_deps=false \
  --releasever rawhide \
  -y --nodocs --nogpg \
"
ENV RPM_LIST="\
  # Site build dependencies
  git \
  npm \
  hugo \
  ruby \
  golang \
  rubygems \
  ruby-libs \
  ruby-default-gems \
  rubygem-asciidoctor \
  # Base from scratch container packages
  glibc-minimal-langpack \
  coreutils-single \
  openssl \
  # Optional developer experience packages
  # ncurses \
  # tmux \
  # vim \
  # dnf \
  # gh \
"

RUN set -ex \
 && mkdir -p ${ROOTFS_PATH} \
 && dnf install --installroot ${ROOTFS_PATH} ${DNF_FLAGS} ${RPM_LIST} \
 && dnf clean all --installroot ${ROOTFS_PATH} \
 && rm -rf ${ROOTFS_PATH}/var/cache/* \
 && echo


FROM scratch
COPY --from=hugo-builder /rootfs /
RUN git config --global --add safe.directory /src
WORKDIR /src
ENTRYPOINT ["bash", "-c", "hack/test-pages.sh"]
LABEL org.opencontainers.image.source https://github.com/uor-framework/uor-framework.github.io