#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

levar_repositorio_m2=true
levar_instaladores=true
instalar_tudo=true
while [ "$1" ]; do
  case "$1" in
    --nao-levar-repositorio_m2) levar_repositorio=false;;
    --nao-levar-instaladores) levar_instaladores=false;;
    --nao-instalar-tudo) instalar_tudo=false;;
  esac
  shift
done

if $levar_repositorio_m2; then
  cd ~/.m2
  d=.m2
  tar cvfz - . | ssh ${USUARIO_REMOTO}@${SERVIDOR_REMOTO} "
    cd
    rm -rf $d && mkdir -p $d && cd $d
    tar xfz -
  "
fi

if $levar_instaladores; then
  cd $INSTALADORES_DIR
  d=$LAB_DIR/`basename $INSTALADORES_DIR`
  tar cvLf - . | ssh ${USUARIO_REMOTO}@${SERVIDOR_REMOTO} "
    cd
    rm -rf $d && mkdir -p $d && cd $d
    tar xf -
  "
fi

$bindir/atualizar-remoto.sh

if $instalar_tudo; then
  ssh ${USUARIO_REMOTO}@${SERVIDOR_REMOTO} "
    export BAIXA_INSTALADORES=false
    source $LAB_DIR/.ambiente && instalar_ambiente
    instalar-tudo.sh
  "
fi
