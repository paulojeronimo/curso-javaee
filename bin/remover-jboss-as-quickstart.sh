#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# cria e muda o diretório corrente p/ $FERRAMENTAS_DIR
rm -rf $REPOSITORIOS_DIR/jboss-as-quickstart
