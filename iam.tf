# Budget IAM 역할 생성
resource "aws_iam_role" "budget_action_role" {
    name = "budgetActionRole"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            Service = "budgets.amazonaws.com"
        }
        }]
    })
    }

# Budget IAM 정책 생성: SSM과 EC2에 대한 접근 권한 부여
resource "aws_iam_role_policy" "budget_action_policy" {
    name = "budgetActionPolicy"
    role = aws_iam_role.budget_action_role.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = [
            "ssm:SendCommand"
            ],
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = [
            "ec2:StopInstances",
            "ec2:TerminateInstances"
            ],
            Effect = "Allow",
            Resource = "*"
        }
        ]
    })
    }