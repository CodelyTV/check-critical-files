#!/usr/bin/env bash
set -euo pipefail

CHECK_CRITICAL_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [ "$CHECK_CRITICAL_HOME" == "/" ]; then
  CHECK_CRITICAL_HOME=""
fi

export CHECK_CRITICAL_HOME

echp "E N T R Y ."

source "$CHECK_CRITICAL_HOME/src/main.sh"

main "$@"

exit $?
