#!/usr/bin/env bash

checker::check() {
  local -r patterns="$1"
  local -r message=$(echo "${2//\\/\\\\}")

  local -r commit_sha=$(github_actions::commit_sha)
  local -r modified_files=$(github::get_commit_modified_files "$commit_sha")

  local -r critical_modified_files=$(echo "$patterns" | coll::map_2 str::contains "$modified_files" | coll::map html::enlist | sed ':a;N;$!ba;s/\n//g')

  if [ -n "$critical_modified_files" ]; then
    local -r final_message="$message<br><br><b>Modified files:</b><br><ul>$critical_modified_files<ul>"

    github::comment_commit "$commit_sha" "$final_message"
  fi
}
