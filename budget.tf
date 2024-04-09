# 예산 관리 .tf
# 일정 금액 도달 시 리소스 또는 서비스 자동 중지(stop), 릴리즈
# **주의사항** 중지 시 EBS 비용 청구 됨. 

# 예산 생성
resource "aws_budgets_budget" "three_tier_budget" {
    name = "3tier-budget"
    budget_type = "COST"
    limit_amount = var.budget_limit_amount
    limit_unit = "USD"
    time_unit = "MONTHLY"
}

# 예산 조치 생성: EC2 인스턴스 중지 Stop EC2 Instances (종료 원할 시 중지 주석 처리)
resource "aws_budgets_budget_action" "stop_ec2_instances" {
    budget_name = aws_budgets_budget.three_tier_budget.name
    action_type = "RUN_SSM_DOCUMENTS"
    approval_model = "AUTOMATIC"
    execution_role_arn = aws_iam_role.budget_action_role.arn
    notification_type = "ACTUAL"

    action_threshold {
        action_threshold_type = "ABSOLUTE_VALUE"
        action_threshold_value = 20
    }

    definition {
        ssm_action_definition {
        action_sub_type = "AWS-StopEC2Instances"
        region = var.region
        instance_ids = [aws_instance.Web_server.id, aws_instance.Was_Server.id] # 웹 서버, 와스 서버 EC2 인스턴스 ID
        }
    }

    subscriber {
        address = var.budget_email_address
        subscription_type = var.budget_subscription_type
    }
}
# 예산 조치 생성: EC2 인스턴스 중지 Stop EC2 Instances (종료 원할 시 중지 주석 처리)



# 예산 조치 생성: EC2 인스턴스 종료 (사용하려면 주석 해제)
/* 주석
resource "aws_budgets_budget_action" "terminate_ec2_instances" {
    budget_name = aws_budgets_budget.three_tier_budget.name
    action_type = "RUN_SSM_DOCUMENTS"
    approval_model = "AUTOMATIC"
    execution_role_arn = aws_iam_role.budget_action_role.arn
    notification_type = "ACTUAL"

    action_threshold {
        action_threshold_type = "ABSOLUTE_VALUE"
        action_threshold_value = 20
    }

    definition {
        ssm_action_definition {
        action_sub_type = "AWS-TerminateEC2Instances"
        region = var.region
        instance_ids = [aws_instance.Web_server.id, aws_instance.Was_Server.id] # 웹 서버, 와스 서버 EC2 인스턴스 ID
        }
    }

    subscriber {
        address = "example@example.com"
        subscription_type = "EMAIL"
    }
}
주석 */
# 예산 조치 생성: EC2 인스턴스 종료 (사용하려면 주석 해제)