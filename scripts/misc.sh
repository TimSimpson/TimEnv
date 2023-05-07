#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

if [[ $(tim_env_has_installed '# Misc') == "" ]]; then    
    mkdir -p "${TIMENV_TOOLS}/misc"
    cp "${this_script_dir}/q.sh" "${TIMENV_TOOLS}/misc/q.sh"
    
    # shellcheck disable=SC2016
    echo '  
###############################################################################
# Misc
###############################################################################

alias q="${TIMENV_TOOLS}/misc/q.sh"

' >> "${TIMENV_STARTUP}"
else
    echo 'Misc tools are already installed.'
fi