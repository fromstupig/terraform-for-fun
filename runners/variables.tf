variable "aws_region" {
  description = "The AWS region things are created in"
  default = "us-east-1"
}

variable "ec2_key_name" {
  description = "AWS EC2 key pair name which is used for ssh access"
  default = "vio-runner-ssh"
}

# Sensitive variable
variable "ec2_public_key" {
  description = "AWS EC2 public key which is used for ssh access"
  default = "You-never-know"
}

variable "group_token" {
  description = "gitlab group token"
  default = "idunknow"
}
# End of sensitive vairable 
