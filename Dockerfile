FROM ubuntu:24.04

# Stop apt from asking questions during install
ENV DEBIAN_FRONTEND=noninteractive

# Add 32-bit support and install CoD4x dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libc6:i386 \
    libstdc++6:i386 \
    libgcc-s1:i386 \
    lib32z1 \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/cod4server

# The binary name from your file list
ENTRYPOINT ["./cod4x18_dedrun"]