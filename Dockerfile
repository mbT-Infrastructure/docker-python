FROM madebytimo/base

RUN install-autonomous.sh install Python && \
    rm -rf /var/lib/apt/lists/*
