output "secret" {
  value       = "${aws_secretsmanager_secret.default.arn}"
  description = "Secret ARN"
}

output "read_policy" {
  value       = "${aws_iam_policy.r_policy.arn}"
  description = "Read policy ARN for the AWS secret"
}

output "write_policy" {
  value       = "${aws_iam_policy.w_policy.arn}"
  description = "Write policy ARN for the AWS secret"
}
