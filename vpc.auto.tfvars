# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.7.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_public_subnets = ["10.7.101.0/24", "10.7.102.0/24"]
vpc_private_subnets = ["10.7.1.0/24", "10.7.2.0/24"]
vpc_database_subnets= ["10.7.151.0/24", "10.7.152.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true
# EC2 Instance Variables
instance_type = "t3.micro"
instance_keypair = "terraform-key"
#private_instance_count = 2
desired_capacity = 4
min_size = 2
max_size = 10
email = "vinodkumar4b9@gmail.com"