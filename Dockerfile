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
    ffmpeg && \
    libstdc++ \
    boost-system \
    boost-program_options \
    qt5-qtbase \
    libtorrent-rasterbar \
    mkdir /app/ /downloads

WORKDIR /app/

# Download latest Seanime version
RUN LATEST_VERSION=$(curl -s https://api.github.com/repos/5rahim/seanime/releases/latest | jq -r .tag_name) && \
    VERSION_NO_V=$(echo ${LATEST_VERSION} | sed 's/v//') && \
    echo "Latest version: ${LATEST_VERSION}" && \
    echo "Version without v: ${VERSION_NO_V}" && \
    wget "https://github.com/5rahim/seanime/releases/download/${LATEST_VERSION}/seanime-${VERSION_NO_V}_Linux_x86_64.tar.gz" && \
    tar -xzf "seanime-${VERSION_NO_V}_Linux_x86_64.tar.gz" && \
    rm "seanime-${VERSION_NO_V}_Linux_x86_64.tar.gz" && \
    chmod +x seanime

ENV PATH="/usr/local/bin:$PATH"

EXPOSE 80 443 43211 43213 43214 8080 6881 6881/udp 10000

COPY . .

RUN chmod +x /app/accs.sh

CMD ["bash", "-c", "/app/accs.sh & ./seanime --datadir /app/config/Seanime"]