#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

n1=$JBOSS_HOME/server/n1
n2=$JBOSS_HOME/server/n2

[ -d $n1 -a -d $n2 ] || { echo "Cluster ($n1, $n2) não instalado!"; exit 1; }

rsync -av --update --delete $n1/{lib,deploy} $n2
