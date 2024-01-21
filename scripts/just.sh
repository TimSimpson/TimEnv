#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

version='1.23.0'
url="https://github.com/casey/just/releases/download/${version}/just-${version}-x86_64-unknown-linux-musl.tar.gz"

if [[ $(tim_env_has_installed '# Just') == "" ]]; then
    pushd /tmp
    mkdir -p "${version}"
    pushd "${version}"
    wget "${url}"

    tar -xvf "just-${version}-x86_64-unknown-linux-musl.tar.gz"
   
    cp just "${TIMENV_TOOLS}/misc/"

    # shellcheck disable=SC2016
    echo '
# Just

' >> "${TIMENV_STARTUP}"
else
    echo 'Just is already installed.'
fi
