#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message="$2"

  local -r modified_files=$(github::get_commit_modified_files "$GITHUB_SHA")

  local -r critial_modified_files=$(echo "$patterns" | coll::map_2 str::contains "$modified_files")

  log::message "Files: $critial_modified_files"

   if [ -n "$critial_modified_files" ]; then
      github::comment "$message\n$critial_modified_files"
    fi
}
