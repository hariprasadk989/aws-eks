provider "aws" {
  region = "us-west-2"

}
data "aws_subnet" "default" {
  id = "subnet-0faa99d5c6c643f68"

}
data "aws_subnet" "default2" {
  id = "subnet-0aaae6a359339791e"
}
resource "aws_eks_cluster" "name" {
  name     = "test-eks"
  role_arn = "arn:aws:iam::382132680530:role/eks-cluster-role"
  vpc_config {
    subnet_ids = [data.aws_subnet.default.id, data.aws_subnet.default2.id]

  }
}