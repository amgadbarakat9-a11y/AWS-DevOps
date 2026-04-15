module "network" {
    source= "./network"
    vpc_cidr=var.vpc_cidr
    subnet1_cidr=var.subnet1_cidr
    subnet2_cidr=var.subnet2_cidr
    public_key_path = var.public_key_path
  region          = var.region
}