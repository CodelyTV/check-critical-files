#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message=$(echo "${2//\\/\\\\}")

  local -r commit_sha=$(github_actions::commit_sha)
  local -r modified_files=$(github::get_commit_modified_files "$commit_sha")

  local -r critical_modified_files=$(echo "$patterns" | coll::map_2 str::contains "$modified_files" | coll::map html::enlist | sed ':a;N;$!ba;s/\n/<br>/g')

  if [ -n "$critical_modified_files" ]; then
    local -r final_message="$message<br><b>Modified files:b</b><br><br><ul>$critical_modified_files<ul>"

    log::message "Message: $final_message"
    github::comment_commit "$commit_sha" "$final_message"
  fi
}
