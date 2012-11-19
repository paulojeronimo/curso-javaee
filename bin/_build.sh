#!/bin/bash

_build() {
  runTarget() {
    local f="$1"
    [ "$f" ] || { echo "Alvo não informado!"; exit 1; }
    type target_$f &> /dev/null || { echo "Alvo \"$f\" não encontrado!"; exit 1; }
    target_$f
  }

  while [ "$1" ]; do
    case "$1" in
      *) target="$1";;
    esac
    shift
  done

  [ "$target" ] || target=$default_target
  runTarget $target
}
