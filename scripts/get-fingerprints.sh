#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

echo 'Grabbing all fingerprints. Store this somewhere so you can double-check it in the future.'

pushd /etc/ssh

for file in *.pub; do
    if [ -f "$file" ]; then 
        ssh-keygen -l -f "${file}"
        ssh-keygen -l -E md5 -f "${file}"
    fi 
done
