import json
import requests
import boto3
from datetime import datetime

# 환경 변수로부터 값을 받아오는 것을 추천합니다.
SLACK_WEBHOOK_URL = "https://insightecom.slack.com/archives/C06HP8GES20"
SES_EMAIL_ADDRESS = "shin.dh922@gmail.com"
S3_BUCKET_NAME = "your-s3-bucket-name"

def lambda_handler(event, context):
    message = event['Records'][0]['Sns']['Message']
    print(f"Received message: {message}")

    # S3에 로그 저장
    s3_client = boto3.client('s3')
    log_key = f"asg-logs/{datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}.txt"
    s3_client.put_object(Bucket=S3_BUCKET_NAME, Key=log_key, Body=message)
    
    # 슬랙 알림 보내기
    requests.post(SLACK_WEBHOOK_URL, json={"text": message})
    
    # SES를 사용해 이메일 보내기 (예제는 간단화됨)
    ses_client = boto3.client('ses')
    ses_client.send_email(
        Source=SES_EMAIL_ADDRESS,
        Destination={'ToAddresses': [SES_EMAIL_ADDRESS]},
        Message={
            'Subject': {'Data': 'ASG Event Notification'},
            'Body': {'Text': {'Data': message}}
        }
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Notification sent successfully!')
    }
