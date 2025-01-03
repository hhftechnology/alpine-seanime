# Alpine Seanime Docker Image

A lightweight Docker image for Seanime, built on Alpine Linux.

[![Docker Image CI/CD](https://github.com/hhftechnology/alpine-seanime/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/hhftechnology/alpine-seanime/actions/workflows/docker-publish.yml)

## Quick Start

```bash
docker run -d \
  --name seanime \
  -p 43211:43211 \
  -p 43213:43213 \
  -p 43214:43214 \
  -p 8080:8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 10000:10000 \
  -v /path/to/config:/app/config/Seanime \
  -v /path/to/downloads:/downloads \
  hhftechnology/alpine-seanime
```

## Container Ports

- `43211`: Main application port
- `43213`, `43214`: Additional application ports
- `8080`: Web interface
- `6881` (TCP/UDP): BitTorrent port
- `10000`: Additional service port

## Volumes

- `/app/config/Seanime`: Configuration directory
- `/downloads`: Download directory

## Environment Variables

Currently, no environment variables are required for basic operation.

## Docker Compose Example

```yaml
services:
  seanime:
    image: hhftechnology/alpine-seanime
    container_name: seanime
    ports:
      - "43211:43211"
      - "43213:43213"
      - "43214:43214"
      - "8080:8080"
      - "6881:6881"
      - "6881:6881/udp"
      - "10000:10000"
    volumes:
      - ./config:/app/config/Seanime
      - ./downloads:/downloads
    restart: unless-stopped
```

## Updates

The image automatically fetches the latest version of Seanime during build time.

## Support

For Seanime-specific issues, please refer to the [Seanime GitHub repository](https://github.com/5rahim/seanime).

For container-related issues, please open an issue in this repository.

## License

This Docker image is provided under the same license as Seanime.
