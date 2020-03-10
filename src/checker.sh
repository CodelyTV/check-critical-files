#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message="$2"

  local -r modified_files=$(github::commit_modified_files "$GITHUB_SHA")

  printf '%s\n' "${patterns[@]}"

  log::message "$message"

  log::message "Total modifications: $modified_files"
}
