resource "aws_instance" "web-1" {
    ami = var.imagename
    instance_type = "var.instance_type"
    key_name = var.key_name
    subnet_id = var.subnet1
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
         Name = "Server-1"
         Env = "Prod"
         Owner = "Sanjay"
 	     CostCenter = "ABCD"
     }
 }