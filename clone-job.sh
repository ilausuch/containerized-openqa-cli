#!/bin/bash
# clone-job.sh <HOST> <JOB ID> <VARIABLE> 

 if [[ $# -lt 2 ]]; then
   echo "./clone-job.sh <HOST> <PR> <Old job> <variable>"
   echo "e.g. ./clone-job.sh https://openqa.opensuse.org 1788382"
   exit 1
fi


docker-compose exec console /usr/share/openqa/script/clone_job.pl --within-instance $1 $2 $3
