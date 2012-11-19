#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# faz o download do Ant
mkdir -p $INSTALADORES_DIR
$BAIXA_INSTALADORES && { wget -c $ANT_INSTALADOR_URL -O $INSTALADORES_DIR/$ANT_INSTALADOR || exit 1; }
$BAIXA_INSTALADORES && { wget -c $JSCH_JAR_URL -O $INSTALADORES_DIR/$JSCH_JAR || exit 1; }

# remove a instalação anterior
$bindir/remover-ant.sh

# cria e muda o diretório corrente p/ $FERRAMENTAS_DIR
mkdir -p $FERRAMENTAS_DIR
cd $FERRAMENTAS_DIR

# extrai o Ant
tar xvfj $INSTALADORES_DIR/$ANT_INSTALADOR

# instala o JSch no diretório lib do Ant
cp $INSTALADORES_DIR/$JSCH_JAR $ANT_DIR/lib

# cria o link ant para o diretório de instalação
ln -s $ANT_DIR ant
