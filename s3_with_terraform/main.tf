resource "aws_s3_bucket" "dc_bucket" {
    bucket = "kg-terraform-demo"
}

resource "aws_s3_bucket_object" "upload" {
  bucket = "kg-terraform-demo"
  key    = "woody.jpg"
  source = "/root/woody.jpg"
}