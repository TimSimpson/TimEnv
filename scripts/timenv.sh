
#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -x

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

function help() {
    echo '
Installs tools. May invoke `sudo`.

Usage:
    '"${1}"' <tool-name>

Tools:
    cpp
    golang
    javascript
    java
    just
    lua
    newp
    packages
    python
    rust
    taplo-cli
'
}

if [[ $# -lt 1 ]]; then
    >&2 echo "expected a command for argument 1"
    help "${0}"
    exit 1
fi

command="${1}"
shift
case "${command}" in
    "cpp" ) "${script_dir}/cpp.sh" "${@}" ;;
    "golang.sh" ) "${script_dir}/golang.sh" "${@}" ;;
     "golang.sh" ) "${script_dir}/golang.sh" "${@}" ;;
    
  "java" ) "${script_dir}/java.sh" "${@}" ;;
 "javascript.sh" ) "${script_dir}/javascript.sh" "${@}" ;;
  "just" ) "${script_dir}/just.sh" "${@}" ;;   
 "lua" ) "${script_dir}/lua.sh" "${@}" ;;
 "newp" ) "${script_dir}/newp.sh" "${@}" ;;
 "packages" ) "${script_dir}/packages.sh" "${@}" ;;
 "python" ) "${script_dir}/python.sh" "${@}" ;;

 "rust" ) "${script_dir}/rust.sh" "${@}" ;;

 "taplo-cli" ) "${script_dir}/taplo-cli.sh" "${@}" ;;






 "help" ) shift; show_help "${@}" ;;
    "run" ) shift; run_something "${@}" ;;
    * ) 
        echo "'${1}' is not a valid command"
        exit 1
        ;;
esac

