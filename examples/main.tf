module "ec2" {
  source = "./modules/ec2"

  image_id    = "ami-018875e7376831abe"
  instance_type = "medium"
  instance_name = "meu-primeiro-terraform"
  vm_disks = [{
    delete_on_termination = true
    device_name           = "disco_so_root"
    volume_size           = 100
    },
    {
      delete_on_termination = true
      device_name           = "disco_so_sistema"
      volume_size           = 200
  }]
  ambiente = "Dev"
}