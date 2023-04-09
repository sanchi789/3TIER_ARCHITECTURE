# variable "aws_ami_bast_host_1" {
#   type        = string
#   default     = 
#   description = "AWS AMI ID"
# }

# variable "aws_ami_bast_host_2" {
#   type        = string
#   default     = ""
#   description = "AWS AMI ID"
# }

variable "inst_type"{
    type=string
    default="t2.micro"
}

variable "key_name"{
    description="Instanse Key Name"
    type=string
    default="pre1"
}

variable "monit_inst"{
    description="Monitoring of Instance"
    type=bool
    default=true
}

variable "bast_vpc_sg_pub"{
    description="VPC SG for public"
    type=any
    default=[""]
}

variable "pub_sub_1"{
    description="Public Subnet for EC2"
    type=string
    default=""
}

variable "pub_sub_2"{
    description="Public Subnet for EC2"
    type=string
    default=""
}

variable "public_ip"{
    type=bool
    default=true
}