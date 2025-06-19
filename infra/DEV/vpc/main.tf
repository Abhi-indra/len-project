module "vpc" {
  source               = "../../MODULES/vpc"
  vpc_name             = var.vpc_name
  cidr_block           = var.cidr_block
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  azs                  = var.azs
}
