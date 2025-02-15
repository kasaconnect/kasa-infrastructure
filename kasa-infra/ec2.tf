
#referencing the resources in modules

module "ec2_instance" {
  source        = "../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
}



#add modules of resources as per requirement