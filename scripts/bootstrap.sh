#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"

ensure_tools_dir_exists

cat "${this_script_dir}/splash.txt"
echo '
Installing dependencies. If something fails, try erasing key lines in 
'"${TIMENV_STARTUP}"' and try again.

' 

"${this_script_dir}/packages.sh"
"${this_script_dir}/rust.sh"
"${this_script_dir}/golang.sh"

echo 'ok'