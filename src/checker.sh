#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message="$2"

  local -r pr_number=$(github_actions::get_pr_number)
  local -r total_modifications=$(github::calculate_total_modifications "$pr_number")

  log::message "Total modifications: $total_modifications"

  local -r label_to_add=$(labeler::label_for "$total_modifications" "$@")

  log::message "Labeling pull request with $label_to_add"

  github::add_label_to_pr "$pr_number" "$label_to_add"

  if [ "$label_to_add" == "size/xl" ]; then
    if [ -n "$message_if_xl" ]; then
      github::comment "$message_if_xl"
    fi

    if [ "$fail_if_xl" == "true" ]; then
      echoerr "Pr is xl, please, short this!!"
      exit 1
    fi
  fi
}
