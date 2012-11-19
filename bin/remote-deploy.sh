#!/bin/bash

bindir=`dirname $0`
source $bindir/../.ambiente

basename=`basename $0 .sh`
ant_xml=$basename.xml
ant_properties=$basename.properties

case `uname` in
  CYGWIN*)
    bindir="`cygpath --windows $bindir`"
    ;;
esac

ant -Dbasedir=. -D${ant_properties}="$bindir/$ant_properties" -f "$bindir/$ant_xml"
