#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <parent_id> <BCI_TESTS_REPO> <BCI_TESTS_BRANCH>"
  echo "Missing arguments:"
  echo "  <parent_id>         : Parent ID"
  echo "  <BCI_TESTS_REPO>    : Git repository URL for BCI tests"
  echo "  <BCI_TESTS_BRANCH>  : Git branch for BCI tests"
  exit 1
fi

source="http://openqa.suse.de"
dest="http://openqa.suse.de"
key="$OPENQA_SUSE_DE_KEY"
secret="$OPENQA_SUSE_DE_SECRET"
parent_id=$1
bci_tests_repo=$2
bci_tests_branch=$3

if [ -z "$key" ] || [ -z "$secret" ]; then
  echo "Error: The environment variables OPENQA_SUSE_DE_KEY and/or OPENQA_SUSE_DE_SECRET are not set."
  exit 1
fi

./run_clone_job.sh "$source" "$dest" "$key" "$secret" "$parent_id" "" ""\
BCI_TESTS_REPO="$bci_tests_repo" BCI_TESTS_BRANCH="$bci_tests_branch"

