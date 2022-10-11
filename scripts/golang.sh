#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

if [[ $(tim_env_has_installed '# Go Lang') == "" ]]; then
    mkdir -p /tmp/golang
    pushd /tmp/golang
    wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz

    rm -rf /usr/local/go
    mkdir -p "${TIMENV_TOOLS}/go/1.19.1"
    sudo tar -C "${TIMENV_TOOLS}/go/1.19.1" -xzf go1.19.1.linux-amd64.tar.gz

    export PATH="${TIMENV_TOOLS}/go/1.19.1/go/bin:${PATH}"
    
    # shellcheck disable=SC2016
    echo '# Go Lang
export PATH="${TIMENV_TOOLS}/go/1.19.1/go/bin:${PATH}"    
    ' >> "${TIMENV_STARTUP}"
else 
    echo 'Go is already installed.'
fi