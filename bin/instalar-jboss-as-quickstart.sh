#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# remove a instalação anterior
$bindir/remover-jboss-as-quickstart.sh

# cria e muda o diretório corrente p/ $FERRAMENTAS_DIR
mkdir -p $REPOSITORIOS_DIR
cd $REPOSITORIOS_DIR

# extrai o Ant
git clone git://github.com/jboss-jdf/jboss-as-quickstart.git --branch jdf-2.0.0.Final
