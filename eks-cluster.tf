provider "kubernetes" {
  host = data.aws_eks_cluster.liatrio-exercise_cluster.endpoint
  token = data.aws_eks_cluster_auth.liatrio-exercise_cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.liatrio-exercise_cluster.certificate_authority.0.data)
}

data "aws_eks_cluster" "liatrio-exercise_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "liatrio-exercise_cluster" {
  name = module.eks.cluster_id
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.2.0"
  
  cluster_name = "liatrio-exercise-cluster"
  cluster_version = "1.21"

  subnets = module.liatrio-exercise-vpc.private_subnets
  vpc_id = module.liatrio-exercise-vpc.vpc_id

  tags = {
      environment = "development"
      application = "liatrio-exercise"
  }

  worker_groups = [
      {
          instance_type = "t2.small"
          name = "worker-group-1"
          asg_desired_capacity = 2

      },

      {
          instance_type = "t2.medium"
          name = "worker-group-2"
          asg_desired_capacity = 1

      },
  ]
}
