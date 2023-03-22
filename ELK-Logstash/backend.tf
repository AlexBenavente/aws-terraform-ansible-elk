terraform {
  backend "s3" {
    #bucket         = <ELK-S3-bucketname>
    key            = "elk-logstash/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}
