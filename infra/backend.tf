terraform {
  backend "s3" {
    bucket         = "cloudsec-app-terraform-state-083141433357"
    key            = "ecs-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloudsec-app-terraform-locks"
    encrypt        = true
  }
}