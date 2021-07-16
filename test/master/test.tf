module "test" {
  source = "./../.."

  name = "admin"
  users = ["henryk.sso"]
  users_arn_map = {"henryk.sso" : "arn:aws:iam::001004805698:user/henryk.sso"}
  policies_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

output "output" {
  value = module.test.role
}