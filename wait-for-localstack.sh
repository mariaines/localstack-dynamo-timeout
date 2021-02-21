#!/bin/sh
# Usage:  wait-for-localstack.sh <match> <cmd>
# Loops and waits until <cmd> returns a response that contains <match>
if [ -f /.dockerenv ]
then
  HOST=localstack
else
  HOST=localhost
fi
MATCH=$1;
shift
SERVICE=$2
CMD=$*
while [ -z "`$CMD 2>&1 | grep $MATCH`" ]
do
    echo "Waiting for Localstack service: $SERVICE...."
    $CMD
    sleep 1
done
echo "Localstack service $SERVICE is available"
