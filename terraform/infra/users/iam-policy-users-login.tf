resource "aws_iam_policy" "users_login_policy" {
  name = "${var.environment}-users-login-policy"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action   = "dynamodb:Query",
    resource = "${aws_dynamodb_table.users.arn}/index/${var.environment}-email-gsi"
  })
}
