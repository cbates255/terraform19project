resource "aws_ecs_cluster" "cluster" {
  name = "example-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "cluster" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "cluster_project"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  cluster_id = aws_ecs_cluster.cluster.id

  task_container_image   = var.dockerimage
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = false

  target_groups = [
    {
      target_group_name = "tg-fargate-example"
      container_port    = 80
    }
  ]

  load_balanced = false

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "project"
    Project     = "test"
  }
}