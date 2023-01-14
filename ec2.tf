# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name                   = "BastionHost"
  #instance_count         = 5
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.this_security_group_id]

}

#AWS EC2 Instance Terraform Module
#EC2 Instances that will be created in VPC Private Subnets
# module "ec2_private" {
#   depends_on = [ module.vpc ] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "2.17.0"
#   # insert the 10 required variables here
#   name                   = "private-vm"
#   ami                    = data.aws_ami.amzlinux2.id
#   instance_type          = var.instance_type
#   key_name               = var.instance_keypair
#   #monitoring             = true
#   vpc_security_group_ids = [module.private_sg.this_security_group_id]
#   #subnet_id              = module.vpc.public_subnets[0]  
#   subnet_ids = [
#     module.vpc.private_subnets[0],
#     module.vpc.private_subnets[1]
#   ]  
#   instance_count         = var.private_instance_count
#   user_data = "${file("app-install.sh")}"
# }

# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  instance = module.ec2_public.id[0]
  vpc      = true
}