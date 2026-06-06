provider "aws" {
  region = "us-east-1"
}

module "my_docker_host" {
  source = "../../../modules/compute/docker_server"

  key_name  = "docker_key"
  repo_url  = "https://github.com/kimruto68/terraform-aws-architecture.git"
  site_path = "modules/aws-devops-portfolio"
}

output "instance_ip" {
  value = module.my_docker_host.public_ip
}