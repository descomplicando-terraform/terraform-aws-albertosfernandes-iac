 variables {
  image_id = "ami-018875e7376831abe"
  instance_type = "medium"
  instance_name = "teste-vm"
  ambiente = "Dev"
  vm_disks = [{
    delete_on_termination = true
    device_name           = "/dev/xvda"
    volume_size           = 100
    },
    {
      delete_on_termination = true
      device_name           = "/dev/xvdb"
      volume_size           = 200
  }]
}

run "validar_vm_aws_ec2" {

  command = apply

  assert {
    condition     = aws_instance.instances.ami == var.image_id
    error_message = "Invalid AMI"
  }

}