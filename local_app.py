import time
import logging
import aiobotocore
from aiobotocore.config import AioConfig
from os import environ
from contextlib import AsyncExitStack

from starlette.applications import Starlette
from starlette.endpoints import HTTPEndpoint, WebSocketEndpoint
from starlette.responses import JSONResponse
from starlette.routing import Route, WebSocketRoute

LOCALSTACK_HOSTNAME = environ.get("LOCALSTACK_HOSTNAME", "localhost")
LOCALSTACK_ENDPOINT = f"http://{LOCALSTACK_HOSTNAME}:4566"

logger = logging.getLogger()
logger.setLevel(logging.INFO)

config = AioConfig(connect_timeout=10, retries={'max_attempts': 0})

session = aiobotocore.get_session()

_exit_stack = AsyncExitStack()

_db_client = None

async def _create_client(*args, **kwargs):
    client = session.create_client(*args, config=config, **kwargs)
    client = await _exit_stack.enter_async_context(client)
    return client


async def get_aws_db_client():
    global _db_client
    if not _db_client:
        _db_client = await _create_client("dynamodb", region_name="us-west-2", endpoint_url=LOCALSTACK_ENDPOINT)
        logger.info("Created db client")
    return _db_client


class CreateDynamoItem(HTTPEndpoint):

    async def get(self, request):
        logger.info("GET REQUEST")
        dynamodb = await get_aws_db_client()
        logger.info("got dynamodb client. Creating item")
        current_time = str(time.time())
        result = await dynamodb.update_item(
            TableName="table2",
            Key={
                "_sk": {"S": current_time},
                "_pk": {"S": current_time},
            },
            UpdateExpression="SET #counter=:zero",
            ExpressionAttributeNames={"#counter": "counter"},
            ExpressionAttributeValues={ ":zero":{"N": "0"}},
            ReturnValues="ALL_NEW"
        )
        logger.info(f"Saved item to dynamo: {result}")
        return JSONResponse(status_code=200)


routes = [
    Route("/create_item", CreateDynamoItem),
]

app = Starlette(debug=True, routes=routes)
