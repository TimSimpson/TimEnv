#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

version='1.14.0'
url="https://github.com/casey/just/releases/download/${version}/just-${version}-x86_64-unknown-linux-musl.tar.gz"

if [[ $(tim_env_has_installed '# Just') == "" ]]; then
    wget 

    https://github.com/casey/just/releases/download/1.14.0/just-1.14.0-x86_64-unknown-linux-musl.tar.gz

    git clone https://github.com/TimSimpson/newp.git "${TIMENV_TOOLS}/newp"
    pushd "${TIMENV_TOOLS}/newp"
    cargo install --path .
    popd

    # shellcheck disable=SC2016
    echo '
###############################################################################
# Newp
###############################################################################

' >> "${TIMENV_STARTUP}"
else
    echo 'Newp is already installed.'
fi
