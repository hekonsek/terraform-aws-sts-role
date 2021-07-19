module "test" {
  source = "./.."

  name = "testrole"
  users = ["henryk.test"]
  users_arn_map = {"henryk.test" : var.user_arn}
  policies_arns = ["arn:aws:iam::aws:policy/AlexaForBusinessFullAccess"]
}

variable "user_arn" {}

output "output" {
  value = module.test.role
}