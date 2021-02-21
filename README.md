# localstack-dynamo-timeout

Start project:
```sh
docker-compose up
```

Trigger dynamo write via GET request to http://0.0.0.0:8000/create_item

See socket timeouts in logs, e.g.:
```sh
Creating network "localstack-dynamo-timeout_services_network" with driver "bridge"
Creating localstack-dynamo-timeout_ecs-local-endpoints_1 ... done
Creating localstack-dynamo-timeout_localstack_1          ... done
Creating localstack-dynamo-timeout_configure-localstack_1 ... done
Creating localstack-dynamo-timeout_uvicorn_app_1          ... done
Attaching to localstack-dynamo-timeout_ecs-local-endpoints_1, localstack-dynamo-timeout_localstack_1, localstack-dynamo-timeout_configure-localstack_1, localstack-dynamo-timeout_uvicorn_app_1
ecs-local-endpoints_1   | time="2021-02-21T21:36:18Z" level=info msg="ecs-local-container-endpoints 1.2.0 (4bc8855) ECS Agent 1.27.0 compatible"
ecs-local-endpoints_1   | time="2021-02-21T21:36:18Z" level=info msg=Running...
configure-localstack_1  | Using cached dependencies
configure-localstack_1  | Copying source files
localstack_1            | Waiting for all LocalStack services to be ready
configure-localstack_1  | Lambda function built
localstack_1            | 2021-02-21 21:36:19,771 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
localstack_1            | 2021-02-21 21:36:19,774 INFO supervisord started with pid 15
localstack_1            | 2021-02-21 21:36:20,777 INFO spawned: 'dashboard' with pid 21
localstack_1            | 2021-02-21 21:36:20,779 INFO spawned: 'infra' with pid 22
localstack_1            | (. .venv/bin/activate; bin/localstack web)
localstack_1            | 2021-02-21 21:36:20,787 INFO success: dashboard entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
uvicorn_app_1           | INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
uvicorn_app_1           | INFO:     Started reloader process [1] using watchgod
localstack_1            | (. .venv/bin/activate; exec bin/localstack start --host)
localstack_1            | LocalStack version: 0.12.4
uvicorn_app_1           | INFO:     Started server process [9]
uvicorn_app_1           | INFO:     Waiting for application startup.
uvicorn_app_1           | INFO:     Application startup complete.
localstack_1            | 2021-02-21 21:36:22,027 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
localstack_1            | Starting local dev environment. CTRL-C to quit.
localstack_1            | LocalStack version: 0.12.4
localstack_1            | !WARNING! - Looks like you have configured $LAMBDA_REMOTE_DOCKER=0 - please make sure to configure $HOST_TMP_FOLDER to point to your host's $TMPDIR
localstack_1            | 2021-02-21T21:36:22:DEBUG:bootstrap.py: Loading plugins - scope "services", module "localstack": <function register_localstack_plugins at 0x7fe574398280>
localstack_1            | 2021-02-21T21:36:25:INFO:localstack.utils.analytics.profiler: Execution of "load_plugin_from_path" took 3621.2801933288574ms
localstack_1            | 2021-02-21T21:36:25:INFO:localstack.utils.analytics.profiler: Execution of "load_plugins" took 3621.555805206299ms
localstack_1            | [2021-02-21 21:36:25 +0000] [25] [INFO] Running on https://0.0.0.0:8081 (CTRL + C to quit)
localstack_1            | 2021-02-21T21:36:25:INFO:hypercorn.error: Running on https://0.0.0.0:8081 (CTRL + C to quit)
localstack_1            | Starting edge router (https port 4566)...
localstack_1            | Starting mock CloudWatch service on http port 4566 ...
localstack_1            | Starting mock DynamoDB service on http port 4566 ...
localstack_1            | Starting mock DynamoDB Streams service on http port 4566 ...
localstack_1            | Starting mock Kinesis service on http port 4566 ...
localstack_1            | Starting mock Lambda service on http port 4566 ...
localstack_1            | Starting mock CloudWatch Logs service on http port 4566 ...
localstack_1            | Starting mock SQS service on http port 4566 ...
localstack_1            | Listening at http://:::60631
localstack_1            | Initializing DynamoDB Local with the following configuration:
localstack_1            | Port:	60499
localstack_1            | InMemory:	true
localstack_1            | DbPath:	null
localstack_1            | SharedDb:	true
localstack_1            | shouldDelayTransientStatuses:	false
localstack_1            | CorsParams:	*
localstack_1            |
localstack_1            | 2021-02-21T21:36:25:INFO:localstack.utils.analytics.profiler: Execution of "load_plugin_from_path" took 3713.153839111328ms
localstack_1            | 2021-02-21T21:36:25:INFO:localstack.utils.analytics.profiler: Execution of "load_plugins" took 3713.3889198303223ms
localstack_1            | 2021-02-21T21:36:25:INFO:localstack.multiserver: Starting multi API server process on port 33837
localstack_1            | [2021-02-21 21:36:25 +0000] [24] [INFO] Running on http://0.0.0.0:33837 (CTRL + C to quit)
localstack_1            | 2021-02-21T21:36:25:INFO:hypercorn.error: Running on http://0.0.0.0:33837 (CTRL + C to quit)
localstack_1            | [2021-02-21 21:36:25 +0000] [24] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
localstack_1            | 2021-02-21T21:36:25:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
localstack_1            | 2021-02-21 21:36:25,911:API:  * Running on http://0.0.0.0:40821/ (Press CTRL+C to quit)
localstack_1            | 2021-02-21T21:36:25:DEBUG:localstack.services.awslambda.lambda_executors: Getting all lambda containers names.
localstack_1            | 2021-02-21T21:36:25:DEBUG:localstack.services.awslambda.lambda_executors: docker ps -a --filter="name=localstack_lambda_*" --format "{{.Names}}"
localstack_1            | 2021-02-21T21:36:26:DEBUG:localstack.services.awslambda.lambda_executors: Removing 0 containers.
localstack_1            | Waiting for all LocalStack services to be ready
localstack_1            | Waiting for all LocalStack services to be ready
configure-localstack_1  | Localstack service dynamodb is available
localstack_1            | Ready.
localstack_1            | 2021-02-21T21:36:35:INFO:localstack.utils.analytics.profiler: Execution of "start_api_services" took 9416.136026382446ms
configure-localstack_1  | {
configure-localstack_1  |     "TableDescription": {
configure-localstack_1  |         "AttributeDefinitions": [
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_pk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_sk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_gsi1_pk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_gsi1_sk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_gsi2_pk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_gsi2_sk",
configure-localstack_1  |                 "AttributeType": "S"
configure-localstack_1  |             }
configure-localstack_1  |         ],
configure-localstack_1  |         "TableName": "table2",
configure-localstack_1  |         "KeySchema": [
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_pk",
configure-localstack_1  |                 "KeyType": "HASH"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "AttributeName": "_sk",
configure-localstack_1  |                 "KeyType": "RANGE"
configure-localstack_1  |             }
configure-localstack_1  |         ],
configure-localstack_1  |         "TableStatus": "ACTIVE",
configure-localstack_1  |         "CreationDateTime": 1613943396.287,
configure-localstack_1  |         "ProvisionedThroughput": {
configure-localstack_1  |             "LastIncreaseDateTime": 0.0,
configure-localstack_1  |             "LastDecreaseDateTime": 0.0,
configure-localstack_1  |             "NumberOfDecreasesToday": 0,
configure-localstack_1  |             "ReadCapacityUnits": 5,
configure-localstack_1  |             "WriteCapacityUnits": 5
configure-localstack_1  |         },
configure-localstack_1  |         "TableSizeBytes": 0,
configure-localstack_1  |         "ItemCount": 0,
configure-localstack_1  |         "TableArn": "arn:aws:dynamodb:us-west-2:000000000000:table/table2",
configure-localstack_1  |         "GlobalSecondaryIndexes": [
configure-localstack_1  |             {
configure-localstack_1  |                 "IndexName": "_gsi2_pk-_gsi2_sk-index",
configure-localstack_1  |                 "KeySchema": [
configure-localstack_1  |                     {
configure-localstack_1  |                         "AttributeName": "_gsi2_pk",
configure-localstack_1  |                         "KeyType": "HASH"
configure-localstack_1  |                     },
configure-localstack_1  |                     {
configure-localstack_1  |                         "AttributeName": "_gsi2_sk",
configure-localstack_1  |                         "KeyType": "RANGE"
configure-localstack_1  |                     }
configure-localstack_1  |                 ],
configure-localstack_1  |                 "Projection": {
configure-localstack_1  |                     "ProjectionType": "ALL"
configure-localstack_1  |                 },
configure-localstack_1  |                 "IndexStatus": "ACTIVE",
configure-localstack_1  |                 "ProvisionedThroughput": {
configure-localstack_1  |                     "ReadCapacityUnits": 5,
configure-localstack_1  |                     "WriteCapacityUnits": 5
configure-localstack_1  |                 },
configure-localstack_1  |                 "IndexSizeBytes": 0,
configure-localstack_1  |                 "ItemCount": 0,
configure-localstack_1  |                 "IndexArn": "arn:aws:dynamodb:ddblocal:000000000000:table/table2/index/_gsi2_pk-_gsi2_sk-index"
configure-localstack_1  |             },
configure-localstack_1  |             {
configure-localstack_1  |                 "IndexName": "_gsi1_pk-_gsi1_sk-index",
configure-localstack_1  |                 "KeySchema": [
configure-localstack_1  |                     {
configure-localstack_1  |                         "AttributeName": "_gsi1_pk",
configure-localstack_1  |                         "KeyType": "HASH"
configure-localstack_1  |                     },
configure-localstack_1  |                     {
configure-localstack_1  |                         "AttributeName": "_gsi1_sk",
configure-localstack_1  |                         "KeyType": "RANGE"
configure-localstack_1  |                     }
configure-localstack_1  |                 ],
configure-localstack_1  |                 "Projection": {
configure-localstack_1  |                     "ProjectionType": "ALL"
configure-localstack_1  |                 },
configure-localstack_1  |                 "IndexStatus": "ACTIVE",
configure-localstack_1  |                 "ProvisionedThroughput": {
configure-localstack_1  |                     "ReadCapacityUnits": 5,
configure-localstack_1  |                     "WriteCapacityUnits": 5
configure-localstack_1  |                 },
configure-localstack_1  |                 "IndexSizeBytes": 0,
configure-localstack_1  |                 "ItemCount": 0,
configure-localstack_1  |                 "IndexArn": "arn:aws:dynamodb:ddblocal:000000000000:table/table2/index/_gsi1_pk-_gsi1_sk-index"
configure-localstack_1  |             }
configure-localstack_1  |         ],
configure-localstack_1  |         "StreamSpecification": {
configure-localstack_1  |             "StreamEnabled": true,
configure-localstack_1  |             "StreamViewType": "NEW_AND_OLD_IMAGES"
configure-localstack_1  |         },
configure-localstack_1  |         "LatestStreamLabel": "2021-02-21T21:36:36.287",
configure-localstack_1  |         "LatestStreamArn": "arn:aws:dynamodb:us-west-2:000000000000:table/table2/stream/2021-02-21T21:36:36.287"
configure-localstack_1  |     }
configure-localstack_1  | }
configure-localstack_1  | {
configure-localstack_1  |     "TimeToLiveSpecification": {
configure-localstack_1  |         "Enabled": true,
configure-localstack_1  |         "AttributeName": "_ttl"
configure-localstack_1  |     }
configure-localstack_1  | }
configure-localstack_1  | DynamodB table table2 created
configure-localstack_1  | {
configure-localstack_1  |     "FunctionName": "DynamoDbStreamFunction",
configure-localstack_1  |     "FunctionArn": "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction",
configure-localstack_1  |     "Runtime": "python3.8",
configure-localstack_1  |     "Role": "arn:aws:iam:isignored",
configure-localstack_1  |     "Handler": "db_stream.stream_handler",
configure-localstack_1  |     "Description": "",
configure-localstack_1  |     "Timeout": 600,
configure-localstack_1  |     "LastModified": "2021-02-21T21:36:37.720+0000",
configure-localstack_1  |     "Version": "1",
configure-localstack_1  |     "VpcConfig": {},
configure-localstack_1  |     "TracingConfig": {
configure-localstack_1  |         "Mode": "PassThrough"
configure-localstack_1  |     },
configure-localstack_1  |     "RevisionId": "b2c6bcb5-7cb6-47f2-b9d9-1a2916080b21",
configure-localstack_1  |     "State": "Active",
configure-localstack_1  |     "LastUpdateStatus": "Successful"
configure-localstack_1  | }
configure-localstack_1  | {
configure-localstack_1  |     "UUID": "ce79d8e0-f3ae-4ea5-be5d-665e75737424",
configure-localstack_1  |     "BatchSize": 10,
configure-localstack_1  |     "EventSourceArn": "arn:aws:dynamodb:us-west-2:000000000000:table/table2",
configure-localstack_1  |     "FunctionArn": "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction",
configure-localstack_1  |     "LastModified": 1613943398.0,
configure-localstack_1  |     "LastProcessingResult": "OK",
configure-localstack_1  |     "State": "Enabled",
configure-localstack_1  |     "StateTransitionReason": "User action"
configure-localstack_1  | }
configure-localstack_1  | DynamoDB Listener Lambda configuration complete
configure-localstack_1  | LOCALSTACK FULLY CONFIGURED
localstack_1            | 2021-02-21T21:36:37:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack-dynamo-timeout_configure-localstack_1 exited with code 0
localstack_1            | ERROR: 'docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' localstack_main': exit code 1; output: b'\nError: No such object: localstack_main\n'
localstack_1            | 2021-02-21T21:37:12:INFO:localstack.services.awslambda.lambda_executors: Unable to get IP address of main Docker container "localstack_main": Command 'docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' localstack_main' returned non-zero exit status 1.
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container with runtime "python3.8" and arn "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction".
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container (status "0"): localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Creating container: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: docker create  --name "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" --entrypoint /bin/bash -v "/tmp/.lambda-build-2":/var/task --interactive -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e HOSTNAME="$HOSTNAME" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT"  -e AWS_LAMBDA_EVENT_BODY='{"Records": [{"eventID": "1", "eventVersion": "1.1", "dynamodb": {"ApproximateCreationDateTime": 1613943431.8936563, "StreamViewType": "NEW_AND_OLD_IMAGES", "SizeBytes": 95, "Keys": {"_sk": {"S": "1613943431.7022018"}, "_pk": {"S": "1613943431.7022018"}}, "NewImage": {"_sk": {"S": "1613943431.7022018"}, "_pk": {"S": "1613943431.7022018"}, "counter": {"N": "0"}}}, "awsRegion": "us-west-2", "eventSource": "aws:dynamodb", "eventName": "INSERT", "eventSourceARN": "arn:aws:dynamodb:us-west-2:000000000000:table/table2"}]}' -e LOCALSTACK_HOSTNAME=192.168.65.2 -e EDGE_PORT=4566 -e _HANDLER=db_stream.stream_handler -e AWS_LAMBDA_FUNCTION_TIMEOUT=600 -e AWS_LAMBDA_FUNCTION_NAME=DynamoDbStreamFunction -e AWS_LAMBDA_FUNCTION_VERSION='$LATEST' -e AWS_LAMBDA_FUNCTION_INVOKED_ARN=arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction -e AWS_LAMBDA_COGNITO_IDENTITY='{}' -e _LAMBDA_SERVER_PORT=5000  --network="localstack-dynamo-timeout_services_network"   "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: Starting container: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:37:12:DEBUG:localstack.services.awslambda.lambda_executors: docker start localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: Getting the entrypoint for image: "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: docker image inspect --format="{{ .Config.Entrypoint }}" "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: Getting container network: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: docker inspect localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction --format "{{ .HostConfig.NetworkMode }}"
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: Using entrypoint "/var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs" for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" on network "localstack-dynamo-timeout_services_network".
localstack_1            | 2021-02-21T21:37:13:DEBUG:localstack.services.awslambda.lambda_executors: Command for docker-reuse Lambda executor:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:37:13:INFO:localstack.services.awslambda.lambda_executors: Running lambda cmd:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
uvicorn_app_1           | INFO:     169.254.170.1:59614 - "GET /create_item HTTP/1.1" 500 Internal Server Error
uvicorn_app_1           | ERROR:    Exception in ASGI application
uvicorn_app_1           | Traceback (most recent call last):
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/uvicorn/protocols/http/httptools_impl.py", line 391, in run_asgi
uvicorn_app_1           |     result = await app(self.scope, self.receive, self.send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/uvicorn/middleware/proxy_headers.py", line 45, in __call__
uvicorn_app_1           |     return await self.app(scope, receive, send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/applications.py", line 111, in __call__
uvicorn_app_1           |     await self.middleware_stack(scope, receive, send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/middleware/errors.py", line 181, in __call__
uvicorn_app_1           |     raise exc from None
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/middleware/errors.py", line 159, in __call__
uvicorn_app_1           |     await self.app(scope, receive, _send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/exceptions.py", line 82, in __call__
uvicorn_app_1           |     raise exc from None
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/exceptions.py", line 71, in __call__
uvicorn_app_1           |     await self.app(scope, receive, sender)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/routing.py", line 566, in __call__
uvicorn_app_1           |     await route.handle(scope, receive, send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/routing.py", line 227, in handle
uvicorn_app_1           |     await self.app(scope, receive, send)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/starlette/endpoints.py", line 30, in dispatch
uvicorn_app_1           |     response = await handler(request)
uvicorn_app_1           |   File "./local_app.py", line 57, in get
uvicorn_app_1           |     ReturnValues="ALL_NEW"
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/client.py", line 141, in _make_api_call
uvicorn_app_1           |     operation_model, request_dict, request_context)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/client.py", line 160, in _make_request
uvicorn_app_1           |     return await self._endpoint.make_request(operation_model, request_dict)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/endpoint.py", line 91, in _send_request
uvicorn_app_1           |     exception):
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/endpoint.py", line 200, in _needs_retry
uvicorn_app_1           |     caught_exception=caught_exception, request_dict=request_dict)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/hooks.py", line 29, in _emit
uvicorn_app_1           |     response = handler(**kwargs)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 183, in __call__
uvicorn_app_1           |     if self._checker(attempts, response, caught_exception):
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 251, in __call__
uvicorn_app_1           |     caught_exception)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 277, in _should_retry
uvicorn_app_1           |     return self._checker(attempt_number, response, caught_exception)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 317, in __call__
uvicorn_app_1           |     caught_exception)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 223, in __call__
uvicorn_app_1           |     attempt_number, caught_exception)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/botocore/retryhandler.py", line 359, in _check_caught_exception
uvicorn_app_1           |     raise caught_exception
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/endpoint.py", line 156, in _do_get_response
uvicorn_app_1           |     http_response = await self._send(request)
uvicorn_app_1           |   File "/usr/local/lib/python3.7/site-packages/aiobotocore/endpoint.py", line 242, in _send
uvicorn_app_1           |     request.method, url=url, headers=headers_, data=data, proxy=proxy)
uvicorn_app_1           |   File "/usr/local/lib64/python3.7/site-packages/aiohttp/client.py", line 544, in _request
uvicorn_app_1           |     await resp.start(conn)
uvicorn_app_1           |   File "/usr/local/lib64/python3.7/site-packages/aiohttp/client_reqrep.py", line 890, in start
uvicorn_app_1           |     message, payload = await self._protocol.read()  # type: ignore
uvicorn_app_1           |   File "/usr/local/lib64/python3.7/site-packages/aiohttp/streams.py", line 604, in read
uvicorn_app_1           |     await self._waiter
uvicorn_app_1           | aiohttp.client_exceptions.ServerTimeoutError: Timeout on reading data from socket
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Lambda arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction result / log output:
localstack_1            | {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}
localstack_1            | > START RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06 Version: $LATEST
localstack_1            | > [INFO]	2021-02-21T21:37:15.632Z	69220249-8de0-1a9f-1dc8-51d365b21c06	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'INSERT', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f0e91be84c0>
localstack_1            | > [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	INSERT(1613943431.7022018/1613943431.7022018)
localstack_1            | > [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	{'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}
localstack_1            | > [INFO]	2021-02-21T21:37:15.637Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Found credentials in environment variables.
localstack_1            | > [INFO]	2021-02-21T21:37:16.348Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Created db client
localstack_1            | > [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | > Traceback (most recent call last):
localstack_1            | >   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            | >     asyncio.get_event_loop().run_until_complete(
localstack_1            | >   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            | >     return future.result()
localstack_1            | >   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            | >     await _process_record(record, lambda_context)
localstack_1            | >   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            | >     result = await dynamodb.update_item(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            | >     http, parsed_response = await self._make_request(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            | >     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            | >     while await self._needs_retry(attempts, operation_model,
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            | >     responses = await self._event_emitter.emit(
localstack_1            | >   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            | >     response = handler(**kwargs)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            | >     if self._checker(attempts, response, caught_exception):
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            | >     should_retry = self._should_retry(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            | >     return self._checker(attempt_number, response, caught_exception)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            | >     checker_response = checker(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            | >     return self._check_caught_exception(
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            | >     raise caught_exception
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            | >     http_response = await self._send(request)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            | >     resp = await self.http_session.request(
localstack_1            | >   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            | >     await resp.start(conn)
localstack_1            | >   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            | >     message, payload = await self._protocol.read()  # type: ignore
localstack_1            | >   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            | >     await self._waiter
localstack_1            | > END RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06
localstack_1            | > REPORT RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06	Init Duration: 2877.58 ms	Duration: 60802.04 ms	Billed Duration: 60900 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            | 2021-02-21T21:38:16:INFO:localstack.services.edge: Unable to find forwarding rule for host "localhost:4566", path "GET /", target header "", auth header "", data "b''"
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container with runtime "python3.8" and arn "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction".
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container (status "1"): localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Getting the entrypoint for image: "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: docker image inspect --format="{{ .Config.Entrypoint }}" "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:38:16:INFO:localstack.services.awslambda.lambda_api: Error executing Lambda function arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:37:15.632Z	69220249-8de0-1a9f-1dc8-51d365b21c06	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'INSERT', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f0e91be84c0>
localstack_1            | [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	INSERT(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	{'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}
localstack_1            | [INFO]	2021-02-21T21:37:15.637Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:37:16.348Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06
localstack_1            | REPORT RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06	Init Duration: 2877.58 ms	Duration: 60802.04 ms	Billed Duration: 60900 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB	 Traceback (most recent call last):
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 558, in run_lambda
localstack_1            |     result = LAMBDA_EXECUTOR.execute(func_arn, func_details, event, context=context,
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 176, in execute
localstack_1            |     return do_execute()
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 168, in do_execute
localstack_1            |     return _run(func_arn=func_arn)
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 149, in wrapped
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 145, in wrapped
localstack_1            |     result = func(*args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 161, in _run
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 149, in _run
localstack_1            |     result = self._execute(func_arn, func_details, event, context, version)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 386, in _execute
localstack_1            |     return super(LambdaExecutorReuseContainers, self)._execute(func_arn, *args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 319, in _execute
localstack_1            |     result = self.run_lambda_executor(cmd, stdin, env_vars=environment, func_details=func_details)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 226, in run_lambda_executor
localstack_1            |     raise Exception('Lambda process returned error status code: %s. Result: %s. Output:\n%s' %
localstack_1            | Exception: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:37:15.632Z	69220249-8de0-1a9f-1dc8-51d365b21c06	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'INSERT', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f0e91be84c0>
localstack_1            | [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	INSERT(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:37:15.633Z	69220249-8de0-1a9f-1dc8-51d365b21c06	{'ApproximateCreationDateTime': 1613943431.8936563, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}}
localstack_1            | [INFO]	2021-02-21T21:37:15.637Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:37:16.348Z	69220249-8de0-1a9f-1dc8-51d365b21c06	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06
localstack_1            | REPORT RequestId: 69220249-8de0-1a9f-1dc8-51d365b21c06	Init Duration: 2877.58 ms	Duration: 60802.04 ms	Billed Duration: 60900 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            |
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Getting container network: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: docker inspect localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction --format "{{ .HostConfig.NetworkMode }}"
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Using entrypoint "/var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs" for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" on network "localstack-dynamo-timeout_services_network".
localstack_1            | 2021-02-21T21:38:16:DEBUG:localstack.services.awslambda.lambda_executors: Command for docker-reuse Lambda executor:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:38:16:INFO:localstack.services.awslambda.lambda_executors: Running lambda cmd:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:39:17:DEBUG:localstack.services.awslambda.lambda_executors: Lambda arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction result / log output:
localstack_1            | {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}
localstack_1            | > START RequestId: e1ac9832-4060-1212-9c63-c86f82714a97 Version: $LATEST
localstack_1            | > [INFO]	2021-02-21T21:38:17.659Z	e1ac9832-4060-1212-9c63-c86f82714a97	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f01ee3404c0>
localstack_1            | > [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | > [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	{'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}
localstack_1            | > [INFO]	2021-02-21T21:38:17.663Z	e1ac9832-4060-1212-9c63-c86f82714a97	Found credentials in environment variables.
localstack_1            | > [INFO]	2021-02-21T21:38:17.897Z	e1ac9832-4060-1212-9c63-c86f82714a97	Created db client
localstack_1            | > [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | > Traceback (most recent call last):
localstack_1            | >   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            | >     asyncio.get_event_loop().run_until_complete(
localstack_1            | >   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            | >     return future.result()
localstack_1            | >   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            | >     await _process_record(record, lambda_context)
localstack_1            | >   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            | >     result = await dynamodb.update_item(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            | >     http, parsed_response = await self._make_request(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            | >     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            | >     while await self._needs_retry(attempts, operation_model,
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            | >     responses = await self._event_emitter.emit(
localstack_1            | >   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            | >     response = handler(**kwargs)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            | >     if self._checker(attempts, response, caught_exception):
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            | >     should_retry = self._should_retry(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            | >     return self._checker(attempt_number, response, caught_exception)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            | >     checker_response = checker(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            | >     return self._check_caught_exception(
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            | >     raise caught_exception
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            | >     http_response = await self._send(request)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            | >     resp = await self.http_session.request(
localstack_1            | >   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            | >     await resp.start(conn)
localstack_1            | >   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            | >     message, payload = await self._protocol.read()  # type: ignore
localstack_1            | >   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            | >     await self._waiter
localstack_1            | > END RequestId: e1ac9832-4060-1212-9c63-c86f82714a97
localstack_1            | > REPORT RequestId: e1ac9832-4060-1212-9c63-c86f82714a97	Init Duration: 64905.92 ms	Duration: 60304.00 ms	Billed Duration: 60400 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            | 2021-02-21T21:39:17:INFO:localstack.services.edge: Unable to find forwarding rule for host "localhost:4566", path "GET /", target header "", auth header "", data "b''"
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container with runtime "python3.8" and arn "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction".
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container (status "1"): localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Getting the entrypoint for image: "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: docker image inspect --format="{{ .Config.Entrypoint }}" "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:39:18:INFO:localstack.services.awslambda.lambda_api: Error executing Lambda function arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: e1ac9832-4060-1212-9c63-c86f82714a97 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:38:17.659Z	e1ac9832-4060-1212-9c63-c86f82714a97	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f01ee3404c0>
localstack_1            | [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	{'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}
localstack_1            | [INFO]	2021-02-21T21:38:17.663Z	e1ac9832-4060-1212-9c63-c86f82714a97	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:38:17.897Z	e1ac9832-4060-1212-9c63-c86f82714a97	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: e1ac9832-4060-1212-9c63-c86f82714a97
localstack_1            | REPORT RequestId: e1ac9832-4060-1212-9c63-c86f82714a97	Init Duration: 64905.92 ms	Duration: 60304.00 ms	Billed Duration: 60400 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB	 Traceback (most recent call last):
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 558, in run_lambda
localstack_1            |     result = LAMBDA_EXECUTOR.execute(func_arn, func_details, event, context=context,
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 176, in execute
localstack_1            |     return do_execute()
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 168, in do_execute
localstack_1            |     return _run(func_arn=func_arn)
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 149, in wrapped
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 145, in wrapped
localstack_1            |     result = func(*args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 161, in _run
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 149, in _run
localstack_1            |     result = self._execute(func_arn, func_details, event, context, version)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 386, in _execute
localstack_1            |     return super(LambdaExecutorReuseContainers, self)._execute(func_arn, *args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 319, in _execute
localstack_1            |     result = self.run_lambda_executor(cmd, stdin, env_vars=environment, func_details=func_details)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 226, in run_lambda_executor
localstack_1            |     raise Exception('Lambda process returned error status code: %s. Result: %s. Output:\n%s' %
localstack_1            | Exception: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: e1ac9832-4060-1212-9c63-c86f82714a97 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:38:17.659Z	e1ac9832-4060-1212-9c63-c86f82714a97	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f01ee3404c0>
localstack_1            | [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:38:17.660Z	e1ac9832-4060-1212-9c63-c86f82714a97	{'ApproximateCreationDateTime': 1613943436.394012, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '0'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}}
localstack_1            | [INFO]	2021-02-21T21:38:17.663Z	e1ac9832-4060-1212-9c63-c86f82714a97	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:38:17.897Z	e1ac9832-4060-1212-9c63-c86f82714a97	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: e1ac9832-4060-1212-9c63-c86f82714a97
localstack_1            | REPORT RequestId: e1ac9832-4060-1212-9c63-c86f82714a97	Init Duration: 64905.92 ms	Duration: 60304.00 ms	Billed Duration: 60400 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            |
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Getting container network: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: docker inspect localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction --format "{{ .HostConfig.NetworkMode }}"
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Using entrypoint "/var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs" for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" on network "localstack-dynamo-timeout_services_network".
localstack_1            | 2021-02-21T21:39:18:DEBUG:localstack.services.awslambda.lambda_executors: Command for docker-reuse Lambda executor:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:39:18:INFO:localstack.services.awslambda.lambda_executors: Running lambda cmd:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Lambda arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction result / log output:
localstack_1            | {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}
localstack_1            | > START RequestId: 0348071c-62d1-127c-9b4f-cd443a157365 Version: $LATEST
localstack_1            | > [INFO]	2021-02-21T21:39:19.27Z	0348071c-62d1-127c-9b4f-cd443a157365	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f7d944de4c0>
localstack_1            | > [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | > [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	{'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}
localstack_1            | > [INFO]	2021-02-21T21:39:19.32Z	0348071c-62d1-127c-9b4f-cd443a157365	Found credentials in environment variables.
localstack_1            | > [INFO]	2021-02-21T21:39:19.100Z	0348071c-62d1-127c-9b4f-cd443a157365	Created db client
localstack_1            | > [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | > Traceback (most recent call last):
localstack_1            | >   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            | >     asyncio.get_event_loop().run_until_complete(
localstack_1            | >   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            | >     return future.result()
localstack_1            | >   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            | >     await _process_record(record, lambda_context)
localstack_1            | >   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            | >     result = await dynamodb.update_item(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            | >     http, parsed_response = await self._make_request(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            | >     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            | >     while await self._needs_retry(attempts, operation_model,
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            | >     responses = await self._event_emitter.emit(
localstack_1            | >   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            | >     response = handler(**kwargs)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            | >     if self._checker(attempts, response, caught_exception):
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            | >     should_retry = self._should_retry(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            | >     return self._checker(attempt_number, response, caught_exception)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            | >     checker_response = checker(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            | >     return self._check_caught_exception(
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            | >     raise caught_exception
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            | >     http_response = await self._send(request)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            | >     resp = await self.http_session.request(
localstack_1            | >   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            | >     await resp.start(conn)
localstack_1            | >   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            | >     message, payload = await self._protocol.read()  # type: ignore
localstack_1            | >   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            | >     await self._waiter
localstack_1            | > END RequestId: 0348071c-62d1-127c-9b4f-cd443a157365
localstack_1            | > REPORT RequestId: 0348071c-62d1-127c-9b4f-cd443a157365	Init Duration: 126274.99 ms	Duration: 60165.04 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            | 2021-02-21T21:40:19:INFO:localstack.services.edge: Unable to find forwarding rule for host "localhost:4566", path "GET /", target header "", auth header "", data "b''"
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container with runtime "python3.8" and arn "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction".
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container (status "1"): localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Getting the entrypoint for image: "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: docker image inspect --format="{{ .Config.Entrypoint }}" "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:40:19:INFO:localstack.services.awslambda.lambda_api: Error executing Lambda function arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 0348071c-62d1-127c-9b4f-cd443a157365 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:39:19.27Z	0348071c-62d1-127c-9b4f-cd443a157365	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f7d944de4c0>
localstack_1            | [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	{'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}
localstack_1            | [INFO]	2021-02-21T21:39:19.32Z	0348071c-62d1-127c-9b4f-cd443a157365	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:39:19.100Z	0348071c-62d1-127c-9b4f-cd443a157365	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 0348071c-62d1-127c-9b4f-cd443a157365
localstack_1            | REPORT RequestId: 0348071c-62d1-127c-9b4f-cd443a157365	Init Duration: 126274.99 ms	Duration: 60165.04 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB	 Traceback (most recent call last):
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 558, in run_lambda
localstack_1            |     result = LAMBDA_EXECUTOR.execute(func_arn, func_details, event, context=context,
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 176, in execute
localstack_1            |     return do_execute()
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 168, in do_execute
localstack_1            |     return _run(func_arn=func_arn)
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 149, in wrapped
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 145, in wrapped
localstack_1            |     result = func(*args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 161, in _run
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 149, in _run
localstack_1            |     result = self._execute(func_arn, func_details, event, context, version)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 386, in _execute
localstack_1            |     return super(LambdaExecutorReuseContainers, self)._execute(func_arn, *args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 319, in _execute
localstack_1            |     result = self.run_lambda_executor(cmd, stdin, env_vars=environment, func_details=func_details)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 226, in run_lambda_executor
localstack_1            |     raise Exception('Lambda process returned error status code: %s. Result: %s. Output:\n%s' %
localstack_1            | Exception: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 0348071c-62d1-127c-9b4f-cd443a157365 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:39:19.27Z	0348071c-62d1-127c-9b4f-cd443a157365	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7f7d944de4c0>
localstack_1            | [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:39:19.28Z	0348071c-62d1-127c-9b4f-cd443a157365	{'ApproximateCreationDateTime': 1613943497.9624057, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '1'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}}
localstack_1            | [INFO]	2021-02-21T21:39:19.32Z	0348071c-62d1-127c-9b4f-cd443a157365	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:39:19.100Z	0348071c-62d1-127c-9b4f-cd443a157365	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 0348071c-62d1-127c-9b4f-cd443a157365
localstack_1            | REPORT RequestId: 0348071c-62d1-127c-9b4f-cd443a157365	Init Duration: 126274.99 ms	Duration: 60165.04 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 47 MB
localstack_1            |
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Getting container network: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: docker inspect localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction --format "{{ .HostConfig.NetworkMode }}"
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Using entrypoint "/var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs" for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" on network "localstack-dynamo-timeout_services_network".
localstack_1            | 2021-02-21T21:40:19:DEBUG:localstack.services.awslambda.lambda_executors: Command for docker-reuse Lambda executor:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:40:19:INFO:localstack.services.awslambda.lambda_executors: Running lambda cmd:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Lambda arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction result / log output:
localstack_1            | {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}
localstack_1            | > START RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2 Version: $LATEST
localstack_1            | > [INFO]	2021-02-21T21:40:20.272Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7fe9cc65b4c0>
localstack_1            | > [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | > [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	{'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}
localstack_1            | > [INFO]	2021-02-21T21:40:20.278Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Found credentials in environment variables.
localstack_1            | > [INFO]	2021-02-21T21:40:20.331Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Created db client
localstack_1            | > [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | > Traceback (most recent call last):
localstack_1            | >   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            | >     asyncio.get_event_loop().run_until_complete(
localstack_1            | >   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            | >     return future.result()
localstack_1            | >   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            | >     await _process_record(record, lambda_context)
localstack_1            | >   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            | >     result = await dynamodb.update_item(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            | >     http, parsed_response = await self._make_request(
localstack_1            | >   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            | >     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            | >     while await self._needs_retry(attempts, operation_model,
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            | >     responses = await self._event_emitter.emit(
localstack_1            | >   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            | >     response = handler(**kwargs)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            | >     if self._checker(attempts, response, caught_exception):
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            | >     should_retry = self._should_retry(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            | >     return self._checker(attempt_number, response, caught_exception)
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            | >     checker_response = checker(attempt_number, response,
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            | >     return self._check_caught_exception(
localstack_1            | >   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            | >     raise caught_exception
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            | >     http_response = await self._send(request)
localstack_1            | >   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            | >     resp = await self.http_session.request(
localstack_1            | >   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            | >     await resp.start(conn)
localstack_1            | >   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            | >     message, payload = await self._protocol.read()  # type: ignore
localstack_1            | >   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            | >     await self._waiter
localstack_1            | > END RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2
localstack_1            | > REPORT RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2	Init Duration: 187519.72 ms	Duration: 60169.48 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 46 MB
localstack_1            | 2021-02-21T21:41:20:INFO:localstack.services.edge: Unable to find forwarding rule for host "localhost:4566", path "GET /", target header "", auth header "", data "b''"
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container with runtime "python3.8" and arn "arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction".
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Priming docker container (status "1"): localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Getting the entrypoint for image: "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: docker image inspect --format="{{ .Config.Entrypoint }}" "lambci/lambda:python3.8"
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Getting status for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction": docker ps -a --filter name='localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction' --format "{{ .Status }} - {{ .Names }}" | grep -w "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" | cat
localstack_1            | 2021-02-21T21:41:20:INFO:localstack.services.awslambda.lambda_api: Error executing Lambda function arn:aws:lambda:us-west-2:000000000000:function:DynamoDbStreamFunction: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:40:20.272Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7fe9cc65b4c0>
localstack_1            | [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	{'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}
localstack_1            | [INFO]	2021-02-21T21:40:20.278Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:40:20.331Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2
localstack_1            | REPORT RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2	Init Duration: 187519.72 ms	Duration: 60169.48 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 46 MB	 Traceback (most recent call last):
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_api.py", line 558, in run_lambda
localstack_1            |     result = LAMBDA_EXECUTOR.execute(func_arn, func_details, event, context=context,
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 176, in execute
localstack_1            |     return do_execute()
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 168, in do_execute
localstack_1            |     return _run(func_arn=func_arn)
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 149, in wrapped
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/utils/cloudwatch/cloudwatch_util.py", line 145, in wrapped
localstack_1            |     result = func(*args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 161, in _run
localstack_1            |     raise e
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 149, in _run
localstack_1            |     result = self._execute(func_arn, func_details, event, context, version)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 386, in _execute
localstack_1            |     return super(LambdaExecutorReuseContainers, self)._execute(func_arn, *args, **kwargs)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 319, in _execute
localstack_1            |     result = self.run_lambda_executor(cmd, stdin, env_vars=environment, func_details=func_details)
localstack_1            |   File "/opt/code/localstack/localstack/services/awslambda/lambda_executors.py", line 226, in run_lambda_executor
localstack_1            |     raise Exception('Lambda process returned error status code: %s. Result: %s. Output:\n%s' %
localstack_1            | Exception: Lambda process returned error status code: 1. Result: {"errorType":"ServerTimeoutError","errorMessage":"Timeout on reading data from socket","stackTrace":["  File \"/var/task/db_stream.py\", line 10, in stream_handler\n    asyncio.get_event_loop().run_until_complete(\n","  File \"/var/lang/lib/python3.8/asyncio/base_events.py\", line 612, in run_until_complete\n    return future.result()\n","  File \"/var/task/db_stream.py\", line 16, in _event_handler\n    await _process_record(record, lambda_context)\n","  File \"/var/task/db_stream.py\", line 29, in _process_record\n    result = await dynamodb.update_item(\n","  File \"/var/task/aiobotocore/client.py\", line 140, in _make_api_call\n    http, parsed_response = await self._make_request(\n","  File \"/var/task/aiobotocore/client.py\", line 160, in _make_request\n    return await self._endpoint.make_request(operation_model, request_dict)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 89, in _send_request\n    while await self._needs_retry(attempts, operation_model,\n","  File \"/var/task/aiobotocore/endpoint.py\", line 197, in _needs_retry\n    responses = await self._event_emitter.emit(\n","  File \"/var/task/aiobotocore/hooks.py\", line 29, in _emit\n    response = handler(**kwargs)\n","  File \"/var/task/botocore/retryhandler.py\", line 183, in __call__\n    if self._checker(attempts, response, caught_exception):\n","  File \"/var/task/botocore/retryhandler.py\", line 250, in __call__\n    should_retry = self._should_retry(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 277, in _should_retry\n    return self._checker(attempt_number, response, caught_exception)\n","  File \"/var/task/botocore/retryhandler.py\", line 316, in __call__\n    checker_response = checker(attempt_number, response,\n","  File \"/var/task/botocore/retryhandler.py\", line 222, in __call__\n    return self._check_caught_exception(\n","  File \"/var/task/botocore/retryhandler.py\", line 359, in _check_caught_exception\n    raise caught_exception\n","  File \"/var/task/aiobotocore/endpoint.py\", line 156, in _do_get_response\n    http_response = await self._send(request)\n","  File \"/var/task/aiobotocore/endpoint.py\", line 241, in _send\n    resp = await self.http_session.request(\n","  File \"/var/task/aiohttp/client.py\", line 544, in _request\n    await resp.start(conn)\n","  File \"/var/task/aiohttp/client_reqrep.py\", line 890, in start\n    message, payload = await self._protocol.read()  # type: ignore\n","  File \"/var/task/aiohttp/streams.py\", line 604, in read\n    await self._waiter\n"]}. Output:
localstack_1            | START RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2 Version: $LATEST
localstack_1            | [INFO]	2021-02-21T21:40:20.272Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	STREAM HANDLER: {'Records': [{'eventID': '1', 'eventVersion': '1.1', 'dynamodb': {'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}, 'awsRegion': 'us-west-2', 'eventSource': 'aws:dynamodb', 'eventName': 'MODIFY', 'eventSourceARN': 'arn:aws:dynamodb:us-west-2:000000000000:table/table2'}]} <bootstrap.LambdaContext object at 0x7fe9cc65b4c0>
localstack_1            | [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	MODIFY(1613943431.7022018/1613943431.7022018)
localstack_1            | [INFO]	2021-02-21T21:40:20.273Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	{'ApproximateCreationDateTime': 1613943559.1497695, 'StreamViewType': 'NEW_AND_OLD_IMAGES', 'SizeBytes': 95, 'Keys': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}}, 'OldImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '2'}}, 'NewImage': {'_sk': {'S': '1613943431.7022018'}, '_pk': {'S': '1613943431.7022018'}, 'counter': {'N': '3'}}}
localstack_1            | [INFO]	2021-02-21T21:40:20.278Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Found credentials in environment variables.
localstack_1            | [INFO]	2021-02-21T21:40:20.331Z	81be0add-7a9f-14ea-ae90-a96743ddc3b2	Created db client
localstack_1            | [ERROR] ServerTimeoutError: Timeout on reading data from socket
localstack_1            | Traceback (most recent call last):
localstack_1            |   File "/var/task/db_stream.py", line 10, in stream_handler
localstack_1            |     asyncio.get_event_loop().run_until_complete(
localstack_1            |   File "/var/lang/lib/python3.8/asyncio/base_events.py", line 612, in run_until_complete
localstack_1            |     return future.result()
localstack_1            |   File "/var/task/db_stream.py", line 16, in _event_handler
localstack_1            |     await _process_record(record, lambda_context)
localstack_1            |   File "/var/task/db_stream.py", line 29, in _process_record
localstack_1            |     result = await dynamodb.update_item(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 140, in _make_api_call
localstack_1            |     http, parsed_response = await self._make_request(
localstack_1            |   File "/var/task/aiobotocore/client.py", line 160, in _make_request
localstack_1            |     return await self._endpoint.make_request(operation_model, request_dict)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 89, in _send_request
localstack_1            |     while await self._needs_retry(attempts, operation_model,
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 197, in _needs_retry
localstack_1            |     responses = await self._event_emitter.emit(
localstack_1            |   File "/var/task/aiobotocore/hooks.py", line 29, in _emit
localstack_1            |     response = handler(**kwargs)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 183, in __call__
localstack_1            |     if self._checker(attempts, response, caught_exception):
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 250, in __call__
localstack_1            |     should_retry = self._should_retry(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 277, in _should_retry
localstack_1            |     return self._checker(attempt_number, response, caught_exception)
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 316, in __call__
localstack_1            |     checker_response = checker(attempt_number, response,
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 222, in __call__
localstack_1            |     return self._check_caught_exception(
localstack_1            |   File "/var/task/botocore/retryhandler.py", line 359, in _check_caught_exception
localstack_1            |     raise caught_exception
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 156, in _do_get_response
localstack_1            |     http_response = await self._send(request)
localstack_1            |   File "/var/task/aiobotocore/endpoint.py", line 241, in _send
localstack_1            |     resp = await self.http_session.request(
localstack_1            |   File "/var/task/aiohttp/client.py", line 544, in _request
localstack_1            |     await resp.start(conn)
localstack_1            |   File "/var/task/aiohttp/client_reqrep.py", line 890, in start
localstack_1            |     message, payload = await self._protocol.read()  # type: ignore
localstack_1            |   File "/var/task/aiohttp/streams.py", line 604, in read
localstack_1            |     await self._waiter
localstack_1            | END RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2
localstack_1            | REPORT RequestId: 81be0add-7a9f-14ea-ae90-a96743ddc3b2	Init Duration: 187519.72 ms	Duration: 60169.48 ms	Billed Duration: 60200 ms	Memory Size: 1536 MB	Max Memory Used: 46 MB
localstack_1            |
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Getting container network: localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: docker inspect localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction --format "{{ .HostConfig.NetworkMode }}"
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Using entrypoint "/var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs" for container "localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction" on network "localstack-dynamo-timeout_services_network".
localstack_1            | 2021-02-21T21:41:20:DEBUG:localstack.services.awslambda.lambda_executors: Command for docker-reuse Lambda executor:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
localstack_1            | 2021-02-21T21:41:20:INFO:localstack.services.awslambda.lambda_executors: Running lambda cmd:  docker exec -e AWS_LAMBDA_EVENT_BODY="$AWS_LAMBDA_EVENT_BODY" -e LOCALSTACK_HOSTNAME="$LOCALSTACK_HOSTNAME" -e EDGE_PORT="$EDGE_PORT" -e _HANDLER="$_HANDLER" -e AWS_LAMBDA_FUNCTION_TIMEOUT="$AWS_LAMBDA_FUNCTION_TIMEOUT" -e AWS_LAMBDA_FUNCTION_NAME="$AWS_LAMBDA_FUNCTION_NAME" -e AWS_LAMBDA_FUNCTION_VERSION="$AWS_LAMBDA_FUNCTION_VERSION" -e AWS_LAMBDA_FUNCTION_INVOKED_ARN="$AWS_LAMBDA_FUNCTION_INVOKED_ARN" -e AWS_LAMBDA_COGNITO_IDENTITY="$AWS_LAMBDA_COGNITO_IDENTITY" -e _LAMBDA_SERVER_PORT="$_LAMBDA_SERVER_PORT" localstack_lambda_arn_aws_lambda_us-west-2_000000000000_function_DynamoDbStreamFunction /var/rapid/init --bootstrap /var/runtime/bootstrap --enable-msg-logs db_stream.stream_handler
```
