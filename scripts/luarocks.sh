#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"


if [[ $(tim_env_has_installed '# Lua') == "" ]]; then    
    mkdir -p /tmp/lua
    pushd /tmp/lua
    wget https://luarocks.org/releases/luarocks-3.9.1.tar.gz
    tar zxpf luarocks-3.9.1.tar.gz
    cd luarocks-3.9.1
    ./configure && make && sudo make install
   
    # shellcheck disable=SC2016
    echo '# Lua was installed
' >> "${TIMENV_STARTUP}"
else
    echo 'Lua is already installed.'
fi
