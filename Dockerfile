FROM madebytimo/base

RUN install-autonomous.sh install Python && \
    rm -rf /var/lib/apt/lists/*

ENV PIP_BREAK_SYSTEM_PACKAGES="1"
