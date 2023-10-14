#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

# Adds the Microsoft package signing key to the list of trusted keys and 
# add the package repository
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update
DEBIAN_FRONTEND=noninteractive sudo -E apt -y --no-install-recommends install \
        aspnetcore-runtime-6.0 \
        dotnet-sdk-6.0 \

