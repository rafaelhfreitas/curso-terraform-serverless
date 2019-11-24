resource "aws_iam_role" "users_register_iam_role" {
  name = "${var.environment}-users-register-iam-role"

  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}


resource "aws_ssm_parameter" "users_register_iam_role" {
  name  = "${var.environment}-users-register-iam-role"
  type  = "String"
  value = "${aws_iam_role.users_register_iam_role.arn}"

}

