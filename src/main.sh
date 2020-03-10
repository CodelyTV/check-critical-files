#!/usr/bin/env bash

source "$PR_SIZE_LABELER_HOME/src/checker.sh"
source "$PR_SIZE_LABELER_HOME/src/ensure.sh"
source "$PR_SIZE_LABELER_HOME/src/github.sh"
source "$PR_SIZE_LABELER_HOME/src/github_actions.sh"
source "$PR_SIZE_LABELER_HOME/src/misc.sh"

main() {
  ensure::env_variable_exist "GITHUB_REPOSITORY"
  ensure::env_variable_exist "GITHUB_EVENT_PATH"
  ensure::total_args 3 "$@"

  export GITHUB_TOKEN="$1"

  checker::check "$2" "$3"

  exit $?
}
