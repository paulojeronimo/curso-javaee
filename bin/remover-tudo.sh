#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

# solicita que os exemplos se limpem (caso as ferramentas p/ isto estejam instaladas ;-)
[ -d $FERRAMENTAS_DIR ] && $bindir/../exemplos/build.sh clean

# apaga o diretório das ferramentas e o cache dos instaladores
rm -rf {$FERRAMENTAS_DIR,$INSTALADORES_DIR}

# apaga alguns arquivos de log que vão aparecendo durante a execução de algumas aplicações
find $bindir/.. -type f -name transaction.log -o -name twiddle.log -delete
