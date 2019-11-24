resource "aws_iam_policy" "users_register_policy" {
  name = "${var.environment}-users-register-policy"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action   = "dynamodb:PutItem",
    resource = "${aws_dynamodb_table.users.arn}"
  })


  /*
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem"
      ],
      "Effect": "Allow",
      "Resource": "${aws_dynamodb_table.users.arn}"
    },
    {
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
    }
   ]
}
EOF

*/
}
