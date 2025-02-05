variable "image_id" {
  type        = string
  description = "Nome da imagem AMI na AWS"
}

variable "instance_type" {
  type        = string
  description = "Define o tipo de instância. Mininal = t2.micro, Medium = t3.micro, High = t4g.micro"
}

variable "instance_name" {
  type        = string
  description = "Nome da instância ec2"
}

variable "vm_disks" {
  type = list(object({
    delete_on_termination = bool
    device_name           = string
    volume_size           = number
  }))
}

variable "ambiente" {
  type        = string
  description = "Valor da tag ambiente"
}
