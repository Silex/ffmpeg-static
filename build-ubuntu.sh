#!/bin/bash

# Install needed updates
sudo apt install build-essential g++ gcc gperf pkg-config tar
# Install needed tools
sudo apt install autoconf automake cmake curl git gawk libtool ragel texi2html
# Install dependencies (only add if needed)
sudo apt install \
  frei0r-plugins-dev \
  libass-dev \
  libcairo2-dev \
  libopencore-amrnb-dev \
  libopencore-amrwb-dev \
  libsdl1.2-dev \
  libtheora-dev \
  libva-dev \
  libvdpau-dev \
  libvo-amrwbenc-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  libxvidcore-dev
#  libfreetype6-dev \
#  libglib2.0-dev \
#  libspeex-dev \
#  libssl-dev \
#  libvorbis-dev \
#  libwebp-dev \
#  zlib1g-dev

# For 12.04
# libx265 requires cmake version >= 2.8.8
# 12.04 only have 2.8.7
ubuntu_version=`lsb_release -rs`
need_ppa=`echo $ubuntu_version'<=12.04' | bc -l`
if [ $need_ppa -eq 1 ]; then
    sudo add-apt-repository ppa:roblib/ppa
    sudo apt-get update
    sudo apt-get install cmake
fi

./build.sh "$@"
