resource "aws_ecr_repository" "hvv19890828" {
  name                 = "hvv19890828"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
