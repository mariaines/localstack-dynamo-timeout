#!/bin/sh
# Runnable on dev box or docker
EXECDIR=`dirname $0`
EXECDIR=`(cd $EXECDIR; pwd)`
ROOTDIR=`(cd $EXECDIR; pwd)`
BUILDDIR=/tmp/.lambda-build-2
if [ -f /.dockerenv ]
then
  HOST=localstack
else
  if [ -z "`docker ps | grep localstack/localstack`" ]
  then
        echo "Localstack is not currently running"
        exit 1
  fi
  HOST=localhost
fi

if [ ! -d "$BUILDDIR" ]
then
    mkdir $BUILDDIR
fi
if [ ! -e $BUILDDIR/DONE -o $ROOTDIR/requirements.txt -nt $BUILDDIR/DONE ]
then
  if [ "$HOST" != "localstack" ]
  then
    echo "Dependencies must be built on Linux Docker image"
    echo "Run docker-compose down/up to rebuild dependencies"
    exit 1
  fi
  echo Rebuilding dependencies
  rm -fr $BUILDDIR/*
  mkdir -p $BUILDDIR/deps
  pip install -t $BUILDDIR -r $ROOTDIR/requirements.txt
  touch $BUILDDIR/DONE
else
  echo Using cached dependencies
fi
echo Copying source files
(cd $ROOTDIR; tar -c -X $EXECDIR/lambda-exclude.lst .)  | (cd $BUILDDIR; tar -x)
echo Lambda function built

#
# Initialize DynamoDB
#
$EXECDIR/wait-for-localstack.sh \
    TableNames \
    aws dynamodb --endpoint-url http://$HOST:4566 --cli-connect-timeout 1 list-tables
# Create and configure table2 if it doesn't already exist
aws dynamodb describe-table \
    --endpoint-url=http://$HOST:4566 \
    --table-name table2 >& /dev/null
if [ $? -ne 0 ]
then
    aws dynamodb create-table \
        --endpoint-url=http://$HOST:4566 \
        --table-name table2 \
        --attribute-definitions \
            AttributeName=_pk,AttributeType=S \
            AttributeName=_sk,AttributeType=S \
            AttributeName=_gsi1_pk,AttributeType=S \
            AttributeName=_gsi1_sk,AttributeType=S \
            AttributeName=_gsi2_pk,AttributeType=S \
            AttributeName=_gsi2_sk,AttributeType=S \
        --key-schema \
            AttributeName=_pk,KeyType=HASH \
            AttributeName=_sk,KeyType=RANGE \
        --provisioned-throughput \
            ReadCapacityUnits=5,WriteCapacityUnits=5 \
        --global-secondary-indexes \
            'IndexName=_gsi1_pk-_gsi1_sk-index,KeySchema=[{AttributeName=_gsi1_pk,KeyType=HASH},{AttributeName=_gsi1_sk,KeyType=RANGE}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}'\
            'IndexName=_gsi2_pk-_gsi2_sk-index,KeySchema=[{AttributeName=_gsi2_pk,KeyType=HASH},{AttributeName=_gsi2_sk,KeyType=RANGE}],Projection={ProjectionType=ALL},ProvisionedThroughput={ReadCapacityUnits=5,WriteCapacityUnits=5}'\
        --stream-specification \
            StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES
    aws dynamodb update-time-to-live \
        --endpoint-url=http://$HOST:4566 \
        --table-name table2 \
        --time-to-live-specification Enabled=true,AttributeName=_ttl
    echo "DynamodB table table2 created"
else
    echo "DynamodB table table2 already exists"
fi
#
# BEGIN: CONFIGURATION OF DYNAMO DB STREAM LISTENER LAMBDA
#
if [ -z "`aws lambda --endpoint-url http://$HOST:4566 list-functions | grep DynamoDbStreamFunction`" ]
then
  aws lambda create-function \
    --endpoint-url http://$HOST:4566 \
    --function-name DynamoDbStreamFunction \
    --runtime python3.8 \
    --role arn:aws:iam:isignored \
    --handler db_stream.stream_handler \
    --code S3Bucket="__local__",S3Key="$BUILDDIR" \
    --timeout 600 \
    --publish
  aws lambda create-event-source-mapping \
    --endpoint-url http://$HOST:4566 \
    --function-name DynamoDbStreamFunction \
    --batch-size 10 --starting-position LATEST \
    --event-source-arn arn:aws:dynamodb:us-west-2:000000000000:table/table2 \
    --starting-position LATEST
else
  aws lambda --endpoint-url http://$HOST:4566 update-function-code \
    --function-name DynamoDbStreamFunction \
    --s3-bucket="__local__" \
    --s3-key="$BUILDDIR" \
    --publish
fi
echo "DynamoDB Listener Lambda configuration complete"

echo "LOCALSTACK FULLY CONFIGURED"
