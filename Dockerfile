FROM alpine:3.19

# Install necessary packages and set up directories
RUN apk add --no-cache \
    mpv \
    vim \
    qbittorrent-nox \
    curl \
    ca-certificates \
    gnupg \
    wget \
    tar \
    jq \
    bash \
    ffmpeg \
    libstdc++ \
    boost-system \
    boost-program_options \
    qt5-qtbase \
    libtorrent-rasterbar && \
    mkdir /app/ /downloads

WORKDIR /app/

# Download specific version of Seanime
ENV PKGVER=2.5.2
RUN wget -q https://github.com/5rahim/seanime/releases/download/v${PKGVER}/seanime-${PKGVER}_Linux_x86_64.tar.gz \
    && tar -xvzf seanime-${PKGVER}_Linux_x86_64.tar.gz \
    && rm seanime-${PKGVER}_Linux_x86_64.tar.gz \
    && chmod +x seanime

ENV PATH="/usr/local/bin:$PATH"

EXPOSE 80 443 43211 43213 43214 8080 6881 6881/udp 10000

COPY . .

RUN chmod +x /app/accs.sh

CMD ["bash", "-c", "qbittorrent-nox --daemon & /app/accs.sh & ./seanime --datadir /app/config/Seanime"]