resource "aws_iam_user" "users" {
  name  = var.project-team-1[count.index]
  count = length(var.project-team-1)

}