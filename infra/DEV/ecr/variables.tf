variable "ecr_repo_name"{
  type = map(object({
    repo_name = string
  }))
}

variable "mutability" {
  type    = string
  default = "MUTABLE"
}