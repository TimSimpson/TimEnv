#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"


if [[ $(tim_env_has_installed '# Python') == "" ]]; then    
    # Installs PyEnv, which helps manage Python versions.
    curl https://pyenv.run | bash
    
    export PYENV_ROOT="${HOME}/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    pyenv install 3.9.14
    pyenv global 3.9.14

    pip install --user pipx
    "${HOME}/.local/bin/pipx" install poetry
    "${HOME}/.local/bin/pipx" install cget
    "${HOME}/.local/bin/pipx" install clearscreen 

    # shellcheck disable=SC2016
    echo '###############################################################################
# Python
###############################################################################

export PYENV_ROOT="${HOME}/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPX_DEFAULT_PYTHON="${HOME}/.pyenv/versions/3.9.14/bin/python"
export PATH="${HOME}/.local/bin:${PATH}"
    ' >> "${TIMENV_STARTUP}"
else
    echo 'Python is already installed.'
fi
