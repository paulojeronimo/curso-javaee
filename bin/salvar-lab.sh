#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# faz uma limpeza dos exemplos para remover tudo o que não é necessário ser salvo
[ -d $FERRAMENTAS_DIR ] && $bindir/../exemplos/build.sh clean

# salva o que restou (excluindo ferramentas e instaladores) em lab.tar.bz2, no diretório do lab
cd $bindir/..
find . -type f ! \(\
 -name lab.tar.bz2 -o\
 -path "./`basename $FERRAMENTAS_DIR`/*" -o\
 -path "./`basename $INSTALADORES_DIR`/*" \) |\
 xargs tar cvf - | bzip2 -c > lab.tar.bz2
