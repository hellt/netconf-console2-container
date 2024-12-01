FROM python:3.11-alpine AS builder

ARG VERSION=3.0.1

RUN apk --no-cache add \
    # build-base \
    # python3-dev \
    libffi-dev \
    openssl-dev \
    ncurses-dev \
    libxml2-dev \
    libxslt-dev \
    git \
    bash && \
    # netconf-console installation
    pip3 install git+https://bitbucket.org/martin_volf/ncc/@${VERSION}

FROM python:3.11-alpine AS prod
# Labels
LABEL maintainer="dodin.roman@gmail.com" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date= \
    org.label-schema.vcs-ref= \
    org.label-schema.name="hellt/netconf-console-docker" \
    org.label-schema.description="Netconf-console2 inside Alpine Docker container" \
    org.label-schema.url="https://github.com/hellt/netconf-console-docker" \
    org.label-schema.vcs-url="https://github.com/hellt/netconf-console-docker" \
    org.label-schema.vendor="Roman Dodin" \
    org.label-schema.docker.cmd="docker run --rm -it hellt/netconf-console2 --help"

RUN apk add --no-cache \
    python3 \
    openssh && \
    # cleanup
    find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf && \
    find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

COPY --from=builder /usr/lib/libx*.* /usr/lib/
COPY --from=builder /usr/lib/libex*.* /usr/lib/
COPY --from=builder /usr/lib/libgcrypt* /usr/lib/
COPY --from=builder /usr/lib/libgpg* /usr/lib/
COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /usr/local/bin/netconf-console2 /usr/local/bin/netconf-console2

WORKDIR /rpc

ENTRYPOINT [ "netconf-console2" ]
