##########################################################################
# ECR, Required for pushing docker image, and get it into cluster
##########################################################################

resource "aws_ecr_repository" "chainlink_test_ecr" {
  name                 = "chainlink-test-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
