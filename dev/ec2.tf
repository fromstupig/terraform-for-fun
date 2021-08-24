data "template_file" "user_data" {
  template = file("./templates/ec2/bastion_init_setup.sh")
}

resource "aws_key_pair" "vio_dev_key" {
  key_name   = var.ec2_key_name
  public_key = var.ec2_public_key
}

# bastion host to manage instances in-case
resource "aws_instance" "bastion_host" {
  count = var.enable_bastion ? 1 : 0

  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  ebs_optimized               = false
  subnet_id                   = element(aws_subnet.public[*].id, count.index)
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  user_data                   = data.template_file.user_data.rendered
  key_name                    = aws_key_pair.vio_dev_key.key_name

  tags = {
    Environment = var.env_name
    Name        = "Bastion host"
  }
}
