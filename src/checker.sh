#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message="$2"

  local -r modified_files=$(github::commit_modified_files "$GITHUB_SHA")

  log::message "STARTING"
#  log::message "$patterns"
#  log::message "$message"

  log::message "LA BUENA 6666566566"
  echo "$patterns" | coll::map_2 str::contains "$modified_files"

  log::message "Total modifications: $modified_files"
}
