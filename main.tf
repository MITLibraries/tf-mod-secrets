/**
 * This module can be used to create an AWS secret. Currently, the only
 * use case we have is for a static third party secret. This module does
 * not support rotation. All it will do is create an empty secret. Adding
 * the actual secret content can be done by either manually updating it
 * through the AWS console or by using the write policy to update it through
 * some other means.
 */

module "label" {
  source = "github.com/mitlibraries/tf-mod-name?ref=0.11"
  name   = "${var.name}"
  tags   = "${var.tags}"
}

resource "aws_secretsmanager_secret" "default" {
  name = "${module.label.name}"
  tags = "${module.label.tags}"
}

data "aws_iam_policy_document" "read" {
  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
    ]

    resources = [
      "${aws_secretsmanager_secret.default.arn}",
    ]
  }
}

data "aws_iam_policy_document" "write" {
  statement {
    actions = [
      "secretsmanager:PutSecretValue",
      "secretsmanager:RotateSecret",
      "secretsmanager:TagResource",
      "secretsmanager:UntagResource",
      "secretsmanager:UpdateSecret",
    ]

    resources = [
      "${aws_secretsmanager_secret.default.arn}",
    ]
  }
}

resource "aws_iam_policy" "r_policy" {
  name        = "${module.label.name}-read-secret"
  description = "Read access to a specific AWS secret"
  policy      = "${data.aws_iam_policy_document.read.json}"
}

resource "aws_iam_policy" "w_policy" {
  name        = "${module.label.name}-write-secret"
  description = "Write access to a specific AWS secret"
  policy      = "${data.aws_iam_policy_document.write.json}"
}
