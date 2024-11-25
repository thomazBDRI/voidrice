#!/bin/sh


appidstatus() {
  status="$(lswt -j | jq ".toplevels | .[] | select(.\"app-id\" | contains(\"$1\")) | .activated" | tr -d '\n')"
}

maxiter=5
iter=0
focusappid() {
  appidstatus $1
  while [[ "$status" != "true" ]]; do
    riverctl focus-view next
    appidstatus $1
    if (( $iter > $maxiter )); then
      break;
    fi

    iter=$(( $iter + 1))
  done
}

focusappid $1
