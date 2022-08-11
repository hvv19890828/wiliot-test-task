#Storage
resource "aws_s3_bucket" "wiliot-tf-back-s3" {
  bucket = random_id.bucket-id.hex
  acl    = "private"

  tags = {
    Name        = random_id.bucket-id.hex
  }
}

resource "random_id" "bucket-id" {
  byte_length = 4
  prefix      = "${var.wiliot-tf-back-s3}-"
}

