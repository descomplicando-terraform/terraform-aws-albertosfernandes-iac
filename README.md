# terraform-aws-albertosfernandes-iac
Módulo terraform aws ec2

### Sobre
Este módulo foi criado durante um treinamento da Linuxtips "descomplicando-terraform". 
Meu objetivo de apresentar este módulo é validar todo conhecimento adquirido com os comandos, blocos e functions terraform dentro de uma ambiente minimamente necessário para testá-los.

### Utilizando o módulo
1. Crie um arquivo main.tf com o seguinte conteúdo, atribuindo valores as variáveis necessárias conforme abaixo:

```
module "albertosfernandes-iac" {
  source  = "descomplicando-terraform/albertosfernandes-iac/aws"
  version = "1.0.0"
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
```

2. Crie também um arquivo variables.tf, declarando todas as variáveis necessárias, conforme abaixo:
```
variable "image_id" {
  type = string
  description = "Nome da imagem AMI na AWS"
}

variable "instance_type" {
    type = string
    description = "Define o tipo de instância. Mininal = t2.micro, Medium = t3.micro, High = t4g.micro"
}

variable "instance_name" {
  type = string
  description = "Nome da instância ec2"
}

variable "vm_disks" {
  type = list(object({
    delete_on_termination = bool
    device_name = string
    volume_size = number
  }))
}

variable "ambiente" {
  type = string
  description = "Valor da tag ambiente"
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.85.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ambiente"></a> [ambiente](#input\_ambiente) | Valor da tag ambiente | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | Nome da imagem AMI na AWS | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Nome da instância ec2 | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Define o tipo de instância. Mininal = t2.micro, Medium = t3.micro, High = t4g.micro | `string` | n/a | yes |
| <a name="input_vm_disks"></a> [vm\_disks](#input\_vm\_disks) | n/a | <pre>list(object({<br/>    delete_on_termination = bool<br/>    device_name           = string<br/>    volume_size           = number<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->