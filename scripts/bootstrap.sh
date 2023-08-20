#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

ensure_tools_dir_exists

echo 'Installing dependencies. If something fails, try erasing header lines in 
'"${TIMENV_STARTUP}"' and try again.

' 

if [[ "${TIMENV_SKIP_SUDO:-}" == "" ]]; then
    "${this_script_dir}/packages.sh"
else
    echo 'Skipping sudo related setup steps'
fi
"${this_script_dir}/rust.sh"
"${this_script_dir}/python.sh"
"${this_script_dir}/javascript.sh"
if [[ "${TIMENV_SKIP_SUDO:-}" == "" ]]; then
    "${this_script_dir}/lua.sh"
else
    echo 'Skipping sudo related setup steps for Lua'
fi
"${this_script_dir}/golang.sh"
"${this_script_dir}/cpp.sh"
"${this_script_dir}/java.sh"
"${this_script_dir}/misc.sh"

echo 'ok'
