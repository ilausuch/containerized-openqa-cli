#!/bin/bash

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <git_repo> <branch> <parent_id> [extra arguments...]"
  echo "Missing arguments:"
  echo "  <git_repo>   : Git repository URL"
  echo "  <branch>     : Git branch"
  echo "  <job>        : Job URL"
  echo "  [extra arguments]: Any number of additional arguments"
  exit 1
fi

repo="$1"
[[ ! $repo =~ \.git$ ]] && repo="${repo.git}"

host="${3%%/t*}"
job="${3##*/}"

source="$host"
dest="$host"

./run_clone_job.sh "$source" "$dest" "$job" "$repo" "$2" "${@:4}"
