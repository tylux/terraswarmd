/* Bucket name must be unique */

resource "aws_s3_bucket" "tfstate_bucket" {
    bucket = "terraswarmd-tf-state-bucket"
    acl = "private"

    tags {
        Name = "Terraform tfstate bucket"
    }
}
