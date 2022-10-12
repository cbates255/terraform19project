#Get available AZs
data "aws_availability_zones" "available" {
    state = "available"
}

#Create a VPC
resource "aws_vpc" "ecsvpc" {
  cidr_block = var.vpccidr
}

#Create 2 private subnets
resource "aws_subnet" "privatesub1" {
  vpc_id     = aws_vpc.ecsvpc
  cidr_block = var.subnet1cidr
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_subnet" "privatesub2" {
  vpc_id = aws_vpc.ecsvpc
  cidr_block = var.subnet2cidr
  availability_zone = data.aws_availability_zones.available.names[1]
}
