FROM madebytimo/builder AS builder

WORKDIR /root/builder
RUN install-autonomous.sh install Python && \
    rm -rf /var/lib/apt/lists/* \
    && PYTHON_VERSION="$(python3-latest --version | sed 's|^.* \([0-9]*\.[0-9]*\)\.[0-9]*$|\1|')" \
    && mkdir -p python/bin python/include python/lib \
    && mv "/usr/local/bin/pip${PYTHON_VERSION}"* /usr/local/bin/pip3-latest \
        "/usr/local/bin/python${PYTHON_VERSION}"* /usr/local/bin/python3-latest python/bin \
    && mv "/usr/local/include/python${PYTHON_VERSION}" python/include \
    && mv "/usr/local/lib/python${PYTHON_VERSION}" python/lib \
    && cp --no-dereference --preserve=mode,ownership,timestamps \
        python/bin/python3-latest python/bin/python3 \
    && cp --no-dereference --preserve=mode,ownership,timestamps \
        python/bin/pip3-latest python/bin/pip3 \
    && cp --no-dereference --preserve=mode,ownership,timestamps \
        python/bin/pip3-latest python/bin/pip

FROM madebytimo/base

COPY --from=builder /root/builder/python /usr/local

ENV PIP_BREAK_SYSTEM_PACKAGES="true"
ENV PIP_NO_CACHE_DIR="true"
