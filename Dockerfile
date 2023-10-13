FROM madebytimo/base

RUN install-autonomous.sh install Python && \
    rm -rf /var/lib/apt/lists/*

ENV PIP_BREAK_SYSTEM_PACKAGES="true"
ENV PIP_NO_CACHE_DIR="true"
