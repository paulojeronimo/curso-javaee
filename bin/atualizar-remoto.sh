#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

cd $bindir/..

excludes=/tmp/rsync.excludes
cat > $excludes <<-FIM
`basename $FERRAMENTAS_DIR`
`basename $INSTALADORES_DIR`
lab.tar.bz2
FIM

rsync -av --update --delete --exclude-from=$excludes . $USUARIO_REMOTO@$SERVIDOR_REMOTO:~/$LAB_DIR
