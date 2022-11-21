#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset


echo '        ~settings~'
git_info="$(git branch -a 2>&1 | grep '*')"
if [ "${git_info}" == '' ]; then
    git_info='n/a'
fi

if [ "${CONAN_DEFAULT_PROFILE_PATH}" == '' ]; then
    conan_info='n/a'
else
    conan_info="${CONAN_DEFAULT_PROFILE_PATH}"
fi

if [ "${CENV_NAME}" == '' ]; then
    cenv_info='n/a'
else
    cenv_info="${CENV_NAME}"
fi

nvm_info="$(node --version)"

echo "cwd   : $(pwd)"
echo "git   : ${git_info}"
echo "conan : ${conan_info}"
echo "cenv  : ${cenv_info}"
echo "node  : ${nvm_info}"

readonly pyenv_stuff="$(pyenv versions |grep '*')"

while IFS= read -r line; do
    if [ "${pyenv_once}" == "" ]; then
        echo "pyenv : ${line}"
    else
        echo "      : ${line}"
    fi
    pyenv_once=true
done <<< "${pyenv_stuff}"
