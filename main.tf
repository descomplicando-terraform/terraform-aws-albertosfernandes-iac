data "aws_ami" "template" {
  most_recent = true

  filter {
    name   = "image-id"
    values = [var.image_id]
  }

  owners = [ "amazon" ]
}

locals {
  instances = {
    mininal = "t2.micro"
    medium  = "t3.micro"
    high    = "t4g.micro"
  }
  my_instance = lookup(local.instances, var.instance_type, "t2.micro")
}

resource "aws_instance" "instances" {
  ami           = data.aws_ami.template.image_id
  instance_type = local.my_instance

  dynamic "ebs_block_device" {
    for_each = var.vm_disks
    content {
      delete_on_termination = ebs_block_device.value.delete_on_termination
      device_name = ebs_block_device.value.device_name
      volume_size = ebs_block_device.value.volume_size
    }
  }
## Arrumar depois fixando cada tag name com sua vm que será criada!!!
 tags = {
  Name      = var.instance_name
  Ambiente  = var.ambiente
 }
}