module "network" {
    source= "/home/amgad/Desktop/projects/first-task/network"
    vpc_cidr=var.vpc_cidr
    subnet1_cidr=var.subnet1_cidr
    subnet2_cidr=var.subnet2_cidr
}