#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

for i in $bindir/instalar-*.sh; do
  name=`basename $i`
  [ "$name" = "`basename $0`" -o "$name" = "instalar-remoto.sh" ] && continue
  $i
done
