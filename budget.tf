# AWS Budget 서비스 설정
resource "aws_budgets_budget" "default" {

    # 예산 이름
    name          = "3_tier_Budget"
    # 예산 유형 (비용 기반 USD)
    budget_type   = "COST"
    # 월간 예상 한도 ($20 USD)
    limit_amount  = 20.0  // 수치를 실수로 표기 (월간 예산 한도: 20.0 달러)
    # 월간 예산 한도 (월별)
    time_unit     = "MONTHLY"

    # 예산 알림 설정
    notification {
        comparison_operator = "GREATER_THAN"
        notification_type = "ACTUAL"
        threshold           = 95
        threshold_type = "PERCENTAGE"
        subscriber_email_addresses = ["shin.dh922@gmail.com"]
        subscriber_sns_topic_arns = [aws_sns_topic.budget_alarm.arn]
    }

}

# Lambda 함수를 위한 IAM 역할 생성
resource "aws_iam_role" "lambda_role" {
    name = "lambda_role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Principal = {
                    Service = "lambda.amazonaws.com"
                },
                Action = "sts:AssumeRole"
            },
        ]
    })
}

# Lambda 역할에 정책 부착
resource "aws_iam_role_policy_attachment" "lambda_policy" {
    role       = aws_iam_role.lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# AWS Lambda 함수 설정
resource "aws_lambda_function" "budget_alarm" {
    function_name = "budget_alarm"
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
resource "aws_cloudwatch_event_rule" "budget_alarm_rule" {
    name                = "BudgetAlarmRule"
    schedule_expression = "rate(1 minute)"
    event_pattern = jsonencode({
        source      = ["aws.budgets"],
        detail_type = ["BUDGET_ALARM"],
        detail      = {
            budgetName = [aws_budgets_budget.default.name]
        }
    })
}

# Lambda 함수에 필요한 권한 부여
resource "aws_lambda_permission" "budget_alarm_permission" {
    statement_id  = "AllowExecutionFromCloudWatch"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.budget_alarm.function_name
    principal     = "events.amazonaws.com"

    source_arn = aws_cloudwatch_event_rule.budget_alarm_rule.arn
}