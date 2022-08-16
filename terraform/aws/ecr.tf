resource "aws_ecr_repository" "wiliot-test-app" {
  name                 = "wiliot-test-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
