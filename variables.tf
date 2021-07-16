variable "name" {
  default = "administrator"
}

variable "users" {
  type = set(string)
  default = []
}

variable "users_arn_map" {
  type = map(string)
  default = {}
}

variable "policies_arns" {
  type = set(string)
  default = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

variable "delegated_root_user_arn" {
  default = ""
}