#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <git_repo> <branch> <parent_id>"
  echo "Missing arguments:"
  echo "  <git_repo>   : Git repository URL"
  echo "  <branch>     : Git branch"
  echo "  <parent_id>  : Parent ID"
  exit 1
fi

source="https://openqa.opensuse.org"
dest="https://openqa.opensuse.org"
key="$OPENQA_OPENSUSE_ORG_KEY"
secret="$OPENQA_OPENSUSE_ORG_SECRET"

if [ -z "$key" ] || [ -z "$secret" ]; then
  echo "Error: The environment variables OPENQA_OPENSUSE_ORG_KEY and/or OPENQA_OPENSUSE_ORG_SECRET are not set."
  exit 1
fi

./run_clone_job.sh "$source" "$dest" "$key" "$secret"  "$3" "$1" "$2" "${@:4}"

