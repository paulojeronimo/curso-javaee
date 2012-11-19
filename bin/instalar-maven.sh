#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# faz o download do Maven
mkdir -p $INSTALADORES_DIR
$BAIXA_INSTALADORES && { wget -c $MAVEN_INSTALADOR_URL -O $INSTALADORES_DIR/$MAVEN_INSTALADOR || exit 1; }

# remove a instalação anterior
$bindir/remover-maven.sh

# cria e muda o diretório corrente p/ $FERRAMENTAS_DIR
mkdir -p $FERRAMENTAS_DIR
cd $FERRAMENTAS_DIR

# extrai o Maven
tar xvfz $INSTALADORES_DIR/$MAVEN_INSTALADOR

# cria o link ant para o diretório de instalação
ln -s $MAVEN_DIR maven
