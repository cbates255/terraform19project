#Create a VPC with 2 private subnets

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "projectTESTVPC"
  cidr = var.vpccidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = []

  enable_nat_gateway = false
  enable_vpn_gateway = true
}