resource "aws_key_pair" "deployer" {
  key_name = "aws-ssh-key"
  public_key = "${file(\"ssh/id_rsa.pub\")}"
}
