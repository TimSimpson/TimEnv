#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

url="https://github.com/tamasfe/taplo/releases/latest/download/taplo-linux-x86_64.gz"

if [[ $(tim_env_has_installed '# taplo-cli') == "" ]]; then
    pushd /tmp
    mkdir -p 'taplo-cli'
    pushd 'taplo-cli'
    wget "${url}"

    gunzip taplo-linux-x86_64.gz

    chmod +x taplo-linux-x86_64
    mv taplo-linux-x86_64 "${TIMENV_TOOLS}/misc/taplo"

    # shellcheck disable=SC2016
    echo '# taplo-cli' >> "${TIMENV_STARTUP}"
else
    echo 'taplo-cli is already installed.'
fi
