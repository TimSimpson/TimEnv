#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"


if [[ $(tim_env_has_installed '# Python') == "" ]]; then    

    curl -sSf https://rye.astral.sh/get | RYE_VERSION="latest" RYE_INSTALL_OPTION="--yes" bash

    # shellcheck disable=SC2016
    echo '###############################################################################
# Python
###############################################################################

. "${HOME}/.rye/env"
' >> "${TIMENV_STARTUP}"

else 
    echo 'Python (Rye) was already installed.'
fi
