#!/bin/bash

# Color codes for bash output
BLUE='\e[36m'
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CLEAR='\e[39m'

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

if [[ "$OS" == "darwin" ]]; then
    if [ -z "$(which jq)" ]; then
        brew install jq
    fi

    brew tap weaveworks/tap
    brew install weaveworks/tap/eksctl
    printf "${GREEN}ekscli installed with the following version:\n$(eksctl version)${CLEAR}\n"
else
    if [ -z "$(which jq)" ]; then
        sudo yum install -y jq
    fi

    if [ -z "$(which eksctl)" ]; then
      curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
      sudo mv /tmp/eksctl /usr/local/bin
      printf "${GREEN}ekscli installed with the following version:\n$(eksctl version)${CLEAR}\n"
    fi
fi