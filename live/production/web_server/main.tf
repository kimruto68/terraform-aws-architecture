# live/production/web_server/main.tf

provider "aws" {
  region = "us-east-1"
}

# This calls the module you created above
module "production_web_server" {
  source = "../../../modules/compute/web_server"

  # Environment-specific settings
  environment   = "production"
  instance_type = "t2.micro"
  key_name      = "docker_key"
  docker_image  = "kimruto/portfolio_website:latest"
}

# Extract the output from the module
output "website_url" {
  value       = module.production_web_server.website_url
  description = "The public URL of the production portfolio website"
}