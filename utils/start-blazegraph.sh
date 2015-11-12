#!/bin/bash

heap=$1
loader=$2

pkill -f 'java -server'

if [[ $loader -eq 1 ]];
then
    z=`echo $heap|sed "s/g//g"`;
    writebuff=`echo $((z*1024*3/4))m`
    java -server -Xmx$heap -XX:MaxDirectMemorySize=$writebuff -Dbigdata.propertyFile=/opt/blazegraph/RWStore.properties -jar /opt/blazegraph/bigdata-bundled.jar
else
    java -server -Xmx$heap -Dbigdata.propertyFile=/opt/blazegraph/RWStore.properties -jar /opt/blazegraph/bigdata-bundled.jar
fi
