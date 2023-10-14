#!/usr/bin/env bash
# if [[ "${TIMENV_COMMON_HEADER:-}" == "" ]]; then
    # export TIMENV_COMMON_HEADER=true
    # this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    export TIMENV_TOOLS="${TIMENV_TOOLS:-${HOME}/Tools}"
    export TIMENV_STARTUP="${TIMENV_TOOLS}/startup.sh"

    function ensure_tools_dir_exists() {
        if [[ ! -d "${TIMENV_TOOLS}/misc" ]]; then
            mkdir -p "${TIMENV_TOOLS}/misc"
        fi
    }
    
    function startup_reminder() {
        echo 'Add the following to '"${TIMENV_STARTUP}"' or your bashrc file:'    
    }

    # Pass unique text here. If it appears in the startup script, something will be
    # returned
    function tim_env_has_installed() {
        ensure_tools_dir_exists
        if [[ ! -f "${TIMENV_STARTUP}" ]]; then
            touch "${TIMENV_STARTUP}"
            chmod +x "${TIMENV_STARTUP}"
            echo '#!/usr/bin/env bash

# This file helps set up tools installed via TimEnv. More info at:
# https://github.com/TimSimpson/TimEnv

export TIMENV_TOOLS='"'${TIMENV_TOOLS}'"'

export PATH="${PATH}:${TIMENV_TOOLS}/misc"
' >> "${TIMENV_STARTUP}"
        fi

        set +e
        grep "${1}" "${TIMENV_STARTUP}" > /dev/null 2>&1
        local result="${?}"
        set -e
        if [[ ${result} -eq 0 ]]; then
            echo 'yep'
        fi        
    }    
# fi
