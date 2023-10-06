#!/bin/bash

if [[ $# -lt 3 ]]; then
  echo "./openqa-clone-custom-git.sh <HOST> <PR> <Old job> <variable>"
  echo "e.g. ./openqa-clone-custom.git.sh openqa.opensuse.org https://github.com/os-autoinst/os-autoinst-distri-openQA/pull/70 https://openqa.opensuse.org/tests/1788382"
  exit 1
fi

docker-compose exec console /usr/share/openqa/script/openqa-clone-custom-git-refspec $2 $3 $4 --clone-job-args="--host $1"
