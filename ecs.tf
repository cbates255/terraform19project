resource "docker_image" "centos8" {
  name = var.dockerimage
}

resource "aws_ecs_cluster" "project_cluster" {
  name = "project_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

}