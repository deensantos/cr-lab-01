#Remote backend
terraform {
  backend "s3" {
    bucket = "brambles-state-files"
    key    = "global/cr-lab-01/iam"
    region = "us-east-2"

    dynamodb_table = "remote-state-file-locks"
    encrypt        = true
  }
}

module "iam-user" {
  source  = "../modules/iam-users"
  name = "ppark"
}

module "iam-user2" {
  source  = "../modules/iam-users"
  name = "bwayne"
}
