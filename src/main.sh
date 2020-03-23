#!/usr/bin/env bash

source "$CHECK_CRITICAL_HOME/src/checker.sh"
source "$CHECK_CRITICAL_HOME/src/ensure.sh"
source "$CHECK_CRITICAL_HOME/src/github.sh"
source "$CHECK_CRITICAL_HOME/src/github_actions.sh"
source "$CHECK_CRITICAL_HOME/src/misc.sh"

main() {
  ensure::env_variable_exist "GITHUB_REPOSITORY"
  ensure::env_variable_exist "GITHUB_SHA"
  ensure::env_variable_exist "GITHUB_EVENT_PATH"
  ensure::total_args 3 "$@"

  export GITHUB_TOKEN="$1"

  log::message "GITHUB ACTIONS DATA"

  github_actions::print_all_data


  log::message "APP DATA"

  checker::check "$2" "$3"

  exit $?
}
