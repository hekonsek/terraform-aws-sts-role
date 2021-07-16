resource "aws_iam_role" "role" {
  name = var.name
  assume_role_policy = data.aws_iam_policy_document.assume-role-policy.json
}

resource "aws_iam_policy_attachment" "role_policy" {
  for_each = var.policies_arns

  name = var.name
  policy_arn = each.key
  roles = [aws_iam_role.role.name]

  users = var.delegated_root_user_arn != "" && each.key == "arn:aws:iam::aws:policy/AdministratorAccess" ? [var.delegated_root_user_arn] : []
}

data "aws_iam_policy_document" "assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = values({ for k, v in var.users_arn_map :  k => v if contains(var.users, k) })
    }

    condition {
      test = "Bool"
      values = ["true"]
      variable = "aws:MultiFactorAuthPresent"
    }
  }
}