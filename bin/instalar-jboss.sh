#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# faz o download do JBoss
mkdir -p $INSTALADORES_DIR
$BAIXA_INSTALADORES && { wget -c $JBOSS_INSTALADOR_URL -O $INSTALADORES_DIR/$JBOSS_INSTALADOR || exit 1; }

# remove a instalação anterior
$bindir/remover-jboss.sh

mkdir -p $FERRAMENTAS_DIR
cd $FERRAMENTAS_DIR

# extrai o JBoss
case $JBOSS_VER in
    6)
    unzip $INSTALADORES_DIR/$JBOSS_INSTALADOR
    ;;
    7)
    tar xvfz $INSTALADORES_DIR/$JBOSS_INSTALADOR
    ;;
esac

# cria o link jboss para o diretório de instalação
ln -s $JBOSS_DIR jboss
