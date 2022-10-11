#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

if [[ $(tim_env_has_installed 'TimEnv has installed packages') == "" ]]; then
    # This file contains common packages and build dependencies for other software,
    # such as Python and Lua.

    sudo apt update
    DEBIAN_FRONTEND=noninteractive sudo -E apt -y --no-install-recommends install \
        build-essential \
        clang \
        cmake \
        cowsay \
        curl \
        fortune \
        htop \
        jq \
        libsasl2-dev \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        llvm \
        lua5.1 \
        liblua5.1-dev \
        lua5.2 \
        liblua5.2-dev \
        lua5.3 \
        liblua5.3-dev \
        make \
        ncdu \
        neofetch \
        openssl \
        pkg-config \
        ranger \
        shellcheck \
        tldr \
        tk-dev \
        tzdata \
        unzip \
        wget \
        xz-utils \
        zlib1g-dev \
        zsh

    echo '# TimEnv has installed packages' >> "${TIMENV_STARTUP}"
else
    echo 'Initial packages are already installed.'
fi