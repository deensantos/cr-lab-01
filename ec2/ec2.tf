terraform {
  backend "s3" {
    bucket = "cr-lab-state-files"
    key    = "global/cr-lab-01/ec2"
    region = "us-east-2"

    dynamodb_table = "remote-state-file-locks"
    encrypt        = true
  }
}

resource "aws_instance" "linux_vm" {
    ami = "ami-0233c2d874b811deb"
    instance_type = "t2.micro"

    network_interface {
    network_interface_id = aws_network_interface.ec2_nic.id
    device_index         = 0
  }

}

resource network_interface "ec2_nic"{
  subnet_id = var.subnet_dev
  private_ip = var.private_ec2_ip
}
