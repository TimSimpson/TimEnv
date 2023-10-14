#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

py_version='3.11.4'

# Installs PyEnv, which helps manage Python versions.
curl https://pyenv.run | bash
    
export PYENV_ROOT="${HOME}/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install "${py_version}"
pyenv global "${py_version}"

pip install --user pipx
"${HOME}/.local/bin/pipx" install poetry
"${HOME}/.local/bin/pipx" install cget
"${HOME}/.local/bin/pipx" install clearscreen 
"${HOME}/.local/bin/pipx" install --include-deps ansible

startup_script=/dev/null

if [[ $(tim_env_has_installed '# Python') == "" ]]; then    
    startup_script="${TIMENV_STARTUP}"
else
    startup_reminder
fi
 
# shellcheck disable=SC2016
echo '###############################################################################
# Python
###############################################################################

export PYENV_ROOT="${HOME}/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPX_DEFAULT_PYTHON="${HOME}/.pyenv/versions/'"${py_version}"'/bin/python"
export PATH="${HOME}/.local/bin:${PATH}"
    ' | sudo tee -a "${startup_script}"
fi
