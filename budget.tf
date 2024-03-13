# AWS Budget 서비스 설정
resource "aws_budgets_budget" "default" {
    name          = "3_tier_Budget"
    budget_type   = "COST"
    limit_amount  = 20.0  // 월간 예산 한도: 20.0 달러
    time_unit     = "MONTHLY"

    # 예산 알림 설정
    notification {
        comparison_operator        = "GREATER_THAN"
        notification_type          = "ACTUAL"
        threshold                  = 100  // 예산 한도 초과 알림을 위해 100% 설정
        threshold_type             = "PERCENTAGE"
        subscriber_email_addresses = ["shin.dh922@gmail.com"]
        subscriber_sns_topic_arns  = [aws_sns_topic.budget_alarm.arn]
    }
}

# 매일 과금 액수를 슬랙 메시지로 보내는 Lambda 함수 설정
resource "aws_lambda_function" "daily_billing_notification" {
    function_name = "daily_billing_notification"
    role          = aws_iam_role.lambda_role.arn
    handler       = "lambda_function.lambda_handler"
    runtime       = "python3.12"
    filename      = "lambda_function.zip"

    environment {
        variables = {
            SNS_TOPIC_ARN = aws_sns_topic.budget_alarm.arn
        }
    }
}

# CloudWatch 이벤트 규칙 설정
resource "aws_cloudwatch_event_target" "daily_billing_target" {
    rule      = aws_cloudwatch_event_rule.daily_billing_rule.name
    target_id = "daily_billing_target"
    arn       = aws_lambda_function.daily_billing_notification.arn
}


# Lambda 함수에 필요한 권한 부여
resource "aws_lambda_permission" "daily_billing_permission" {
    statement_id  = "AllowExecutionFromCloudWatch"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.daily_billing_notification.function_name
    principal     = "events.amazonaws.com"

    source_arn = aws_cloudwatch_event_rule.daily_billing_rule.arn
}

# 예산 초과 시 EC2, RDS, EIP 서비스 정지를 위한 Lambda 함수 설정
resource "aws_lambda_function" "stop_services_on_budget_exceed" {
    function_name = "stop_services_on_budget_exceed"
    role          = aws_iam_role.lambda_role.arn
    handler       = "lambda_function.lambda_handler"
    runtime       = "python3.12"
    filename      = "lambda_function.zip"

    environment {
        variables = {
            SNS_TOPIC_ARN = aws_sns_topic.budget_alarm.arn
        }
    }
}

# CloudWatch 이벤트 규칙 설정
resource "aws_cloudwatch_event_rule" "stop_services_on_budget_exceed_rule" {
    name                = "StopServicesOnBudgetExceedRule"
    schedule_expression = "cron(0 12 * * ? *)"  // 매일 12:00 PM에 실행
}

resource "aws_cloudwatch_event_target" "stop_services_target" {
    rule      = aws_cloudwatch_event_rule.stop_services_on_budget_exceed_rule.name
    target_id = "stop_services_target"
    arn       = aws_lambda_function.stop_services_on_budget_exceed.arn
}


# Lambda 함수에 필요한 권한 부여
resource "aws_lambda_permission" "stop_services_permission" {
    statement_id  = "AllowExecutionFromCloudWatch"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.stop_services_on_budget_exceed.function_name
    principal     = "events.amazonaws.com"

    source_arn = aws_cloudwatch_event_rule.stop_services_on_budget_exceed_rule.arn
}
