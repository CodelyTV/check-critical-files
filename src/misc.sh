#!/usr/bin/env bash

echoerr() {
  echo "$@" 1>&2
}

log::message() {
  echo "--------------"
  echo "$@"
}

coll::join_by() {
  local IFS="$1"
  shift
  echo "$*"
}

coll::map() {
  local -r fn="$1"

  for x in $(cat); do
    "$fn" "$x"
  done
}

coll::map_2() {
  local -r fn="$1"
  local -r arg="$2"

  for x in $(cat); do
    "$fn" "$arg" "$x"
  done
}

str::quote() {
  echo "\"$1\""
}

str::contains() {
  echo "$2 should be cointained"
  echo "+++++++"
  echo "$1" | grep "$2" || true
  echo "+++++++"
  echo "---- $1 ----- $2 -------"
  echo ""
  echo ""
  echo ""
  echo ""
}
