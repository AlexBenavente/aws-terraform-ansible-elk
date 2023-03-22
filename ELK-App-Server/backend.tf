terraform {
  backend "s3" {
    #bucket         = <ELK-S3-bucketname>
    key            = "elk-app-server/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}
