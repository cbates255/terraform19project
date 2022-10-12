resource "docker_image" "centos8" {
  name = var.dockerimage
}

resource "aws_ecs_cluster" "projectcluster" {
  name = "project_cluster"
}

resource "aws_ecs_cluster_capacity_providers" "capacity" {
  cluster_name = aws_ecs_cluster.projectcluster

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

