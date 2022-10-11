#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

if [[ $(tim_env_has_installed '# C++') == "" ]]; then    
    git clone https://github.com/TimSimpson/cenv.git "${TIMENV_TOOLS}/cenv"
    pushd "${TIMENV_TOOLS}/cenv"
    ./install.sh

    # shellcheck disable=SC2016
    echo '  
###############################################################################
# C++
###############################################################################

source "${TIMENV_TOOLS}/cenv/resources/bash-support.sh"

' >> "${TIMENV_STARTUP}"
else
    echo 'C++ is already installed.'
fi