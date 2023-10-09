import json

import boto3


def lambda_handler(event, context):

    record = event['Records'][0]
    message_body = record['body']

    # TODO: process the message body
    

    return {
        'statusCode': 200,
        'body': json.dumps('SQS Message processed successfully!')
    }
