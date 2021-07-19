module "test" {
  source = "./.."

  name = "testrole"
  users = ["henryk.test"]
  users_arn_map = {"henryk.sso" : "arn:aws:iam::001234567890:user/henryk.sso"}
  policies_arns = ["arn:aws:iam::aws:policy/AlexaForBusinessFullAccess"]
}

output "output" {
  value = module.test.role
}