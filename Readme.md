# Python image

This image contains a python installation.

## Installation

1. Pull from [Docker Hub], download the package from [Releases] or build using `builder/build.sh`

## Usage

This Container image extends the [base image]. Make sure to also configure environment variables,
ports and volumes from that image.

## Development

To run for development execute:

```bash
docker compose --file docker-compose-dev.yaml up --build
```

[base image]: https://github.com/mbT-Infrastructure/docker-base
[Docker Hub]: https://hub.docker.com/r/madebytimo/python
[Releases]: https://github.com/mbt-infrastructure/docker-python/releases
