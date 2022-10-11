#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"


if [[ $(tim_env_has_installed '# Rust') == "" ]]; then
    mkdir -p /tmp/rust
    pushd /tmp/rust
    wget --https-only https://sh.rustup.rs --output-document sh.rustup.rs
    chmod +x sh.rustup.rs
    ./sh.rustup.rs -y

    # shellcheck disable=SC2016
    echo '# Rust
source "${HOME}/.cargo/env"
' >> "${TIMENV_STARTUP}"

    # shellcheck source=/dev/null
    source "${HOME}/.cargo/env"
    
    rustup default stable

    # Install some classic tools
    cargo install bat
    cargo install just
    cargo install taplo-cli
else
    echo 'Rust is already installed.'
fi