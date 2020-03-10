#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message="$2"

  local -r modified_files=$(github_actions::get_commit_modified_files)

  log::message "STARTINGaaaaa"
  log::message "TOKEN: $GITHUB_SHA"
  log::message "ECHAA: $modified_files"

  log::message "LA BUENA 888"
  echo "$patterns" | coll::map_2 str::contains "$modified_files"

  log::message "Total modifications: $modified_files"
}
