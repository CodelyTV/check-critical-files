#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message=$(echo "${2//\\/\\\\}")

  local -r modified_files=$(github::get_commit_modified_files "$GITHUB_SHA")
  local -r pr_number=$(github_actions::get_pr_number)

  local -r critial_modified_files=$(echo "$patterns" | coll::map_2 str::contains "$modified_files")

  log::message "Files: $critial_modified_files"
  log::message "Message: $message"

   if [ -n "$critial_modified_files" ]; then
      github::comment "$pr_number" "'$message\n$critial_modified_files'"
    fi
}
