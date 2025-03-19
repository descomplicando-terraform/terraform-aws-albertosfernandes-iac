module "albertosfernandes-iac" {
  source        = "descomplicando-terraform/albertosfernandes-iac/aws"
  version       = "1.0.0"
  image_id      = "ami-018875e7376831abe"
  instance_type = "medium"
  instance_name = "meu-primeiro-terraform"
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
  ambiente = "Dev"
}