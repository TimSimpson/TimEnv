#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

this_script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=/dev/null
source "${this_script_dir}/common.sh"


if [[ $(tim_env_has_installed '# Java ☕') == "" ]]; then
    mkdir -p /tmp/java
    pushd /tmp/java
    wget https://download.java.net/java/GA/jdk19/877d6127e982470ba2a7faa31cc93d04/36/GPL/openjdk-19_linux-x64_bin.tar.gz 
    checksum=$(shasum -a 256 openjdk-19_linux-x64_bin.tar.gz | cut -d' ' -f1)
    if [[ "${checksum}" != 'f47aba585cfc9ecff1ed8e023524e8309f4315ed8b80100b40c7dcc232c12f96' ]] ; then
        echo 'Checksum of JDK download file failed!'
        exit 1
    fi
    mkdir -p "${TIMENV_TOOLS}/java"
    tar -xvf openjdk-19_linux-x64_bin.tar.gz  --directory "${TIMENV_TOOLS}/java/"

    export JAVA_HOME="${TIMENV_TOOLS}/java/jdk-19"

    wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
    checksum=$(shasum -a 256 apache-maven-3.8.6-bin.tar.gz | cut -d' ' -f1)    
    if [[ "${checksum}" != 'c7047a48deb626abf26f71ab3643d296db9b1e67f1faa7d988637deac876b5a9' ]] ; then
        echo 'Checksum of Maven download file failed!'
        exit 1
    fi

    mkdir -p "${TIMENV_TOOLS}/maven"
    tar -xvf apache-maven-3.8.6-bin.tar.gz  --directory "${TIMENV_TOOLS}/maven"

    # shellcheck disable=SC2016
    echo '    
###############################################################################
# Java ☕
###############################################################################
export JAVA_HOME="${TIMENV_TOOLS}/java/jdk-19"
export PATH="${JAVA_HOME}/bin:${PATH}"    
export MAVEN_ROOT="${TIMENV_TOOLS}/Tools/maven/apache-maven-3.8.6"
export PATH="${MAVEN_ROOT}/bin:$PATH"

' >> "${TIMENV_STARTUP}"
else
    echo 'Java ☕ is already installed.'
fi