data "aws_ecr_image" "hvv19890828" {
  repository_name = "hvv19890828"
  image_tag       = "latest"
}

data "aws_availability_zones" "available" {
}
