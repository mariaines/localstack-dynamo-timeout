import logging
import asyncio
from local_app import get_aws_db_client

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def stream_handler(event, lambda_context):
    logger.info(f"STREAM HANDLER: {event} {lambda_context}")
    asyncio.get_event_loop().run_until_complete(
        (_event_handler(event, lambda_context))
    )

async def _event_handler(event, lambda_context):
    for record in event["Records"]:
        await _process_record(record, lambda_context)

async def _process_record(record, lambda_context):
    event_name = record["eventName"]
    dynamo_data = record["dynamodb"]
    pk = dynamo_data["Keys"]["_pk"]["S"]
    sk = dynamo_data["Keys"]["_sk"]["S"]
    logger.info(f"{event_name}({pk}/{sk})")
    logger.info(dynamo_data)
    counter = int(dynamo_data["NewImage"]["counter"]["N"])
    logger.debug(f"Value: {counter}")
    if counter < 10:
        dynamodb = await get_aws_db_client()
        result = await dynamodb.update_item(
            TableName="table2",
            Key=dynamo_data["Keys"],
            UpdateExpression=f"SET #counter=:counter",
            ExpressionAttributeNames={"#counter": "counter"},
            ExpressionAttributeValues={":counter": {"N": f"{counter + 1}"}},
            ReturnValues="ALL_NEW"
        )
        logger.info(f"Saved item to dynamo: {result}")
