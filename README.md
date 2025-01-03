# Alpine Seanime Docker Image

A lightweight Docker image for Seanime, built on Alpine Linux.

[![Docker Image CI/CD](https://github.com/hhftechnology/alpine-seanime/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/hhftechnology/alpine-seanime/actions/workflows/docker-publish.yml)

## 🚀 Quick Start

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
  -v ./config/seanime:/home/seanime/.config/Seanime \
  -v ./config/qBittorrent:/home/seanime/.config/qBittorrent \
  -v ./downloads:/home/seanime/Downloads \
  hhftechnology/alpine-seanime
```

## 📦 Included Components

- **Seanime**: v2.5.2
- **qBittorrent-nox**: For torrent management
- **MPV**: Media player support
- **FFmpeg**: Media processing

## 🔌 Container Ports

- `43211`: Seanime web interface
- `43213`, `43214`: Additional Seanime ports
- `8080`: qBittorrent web interface
- `6881` (TCP/UDP): BitTorrent port
- `10000`: Additional service port

## 📂 Volumes

- `/home/seanime/.config/Seanime`: Seanime configuration directory
- `/home/seanime/.config/qBittorrent`: qBittorrent configuration directory
- `/home/seanime/Downloads`: Download directory

## 🛠️ Setup Instructions

1. Clone the project or create a `docker-compose.yml` file with the required configuration.
2. Start the services using the following command:

```bash
docker-compose up
```

## 📝 Docker Compose Example

```yaml
version: '3'
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
      - ./config/seanime:/home/seanime/.config/Seanime
      - ./config/qBittorrent:/home/seanime/.config/qBittorrent
      - ./downloads:/home/seanime/Downloads
    restart: unless-stopped
```

## 🔑 qBittorrent Configuration

When initializing Seanime, you'll be asked to provide **qBittorrent** details. Use the following credentials:  

- **Username**: `admin`  
- **Password**: `admin123`  
- **Port**: `8080`  

## 📁 Library Path Setup

Provide the **Library Path** as per your Docker Compose volume configuration:  
`/home/seanime/Downloads`

## 🌐 Access the Application

Once the services are running, you can access:
- Seanime: **http://localhost:43211**
- qBittorrent: **http://localhost:8080**

*(Replace `localhost` with your server's IP if accessing remotely.)*

## 🎬 Stream with Jellyfin (Optional)

Want to stream downloaded videos using **Jellyfin**?  

1. Update the **download volume path** in `docker-compose.yml` to point to Jellyfin's media location.  
2. Jellyfin will automatically pick up the files for streaming.  

## 🔄 Updates

The current version (2.5.2) can be updated by modifying the PKGVER environment variable in the Dockerfile.

## 🆘 Support

- For Seanime-specific issues, please refer to the [Seanime GitHub repository](https://github.com/5rahim/seanime).
- For container-related issues, please open an issue in this repository.

## 📜 License

This Docker image is provided under the same license as Seanime.
