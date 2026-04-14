terraform {
  backend "s3" {
    bucket = "terraform-s30"
    key    = "terraform.s3"
    region = "us-east-2"
    dynamodb_table="test"
  }
}
 