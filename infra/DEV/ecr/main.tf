module "ecr" {
  source        = "../../MODULES/ecr"
  for_each      = var.ecr_repo_name
  ecr_repo_name = each.value.repo_name
  mutability    = var.mutability
}