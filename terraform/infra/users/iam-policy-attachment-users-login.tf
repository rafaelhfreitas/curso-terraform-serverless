resource "aws_iam_policy_attachment" "users_login_policy_attachment" {

  name       = "${var.environment}-users-login-attachment"
  roles      = ["${aws_iam_role.users_login_iam_role.name}"]
  policy_arn = "${aws_iam_policy.users_login_policy.arn}"

}
