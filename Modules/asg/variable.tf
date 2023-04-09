# variable "inst_name_pri"{
#     description="Instance Name in Private ASG"
#     type=string
#     default="Private Launch Config"
# }

# variable "inst_name_pub"{
#     description="Instance Name in Public ASG"
#     type=string
#     default="Public Launch Config"
# }


variable "inst_imageid_pri"{
    description="Image ID"
    type=string
    default=""
}

variable "inst_imageid_pub"{
    description="Image ID"
    type=string
    default=""
}


variable "inst_type"{
    description="Instance Type in ASG"
    type=string
    default="t2.micro"
}

variable "public_ip"{
    description="Allow Public IP Address"
    type=bool
    default=true
}

# variable "asg_name_pri"{
#     description="ASG Name"
#     type=string
#     default="Private EC2 Auto Scailing"
# }

# variable "asg_name_pub"{
#     description="ASG Name"
#     type=string
#     default="Public EC2 Auto Scailing"
# }

variable "min_size"{
    type=number
    default=1
}

variable "max_size"{
    type=number
    default=2
}

variable "zone_ide_pri"{
    description="VPC Zone Identifiers Private"
    type=list(string)
    default=[""]
}

variable "zone_ide_pub"{
    description="VPC Zone Identifiers Public"
    type=list(string)
    default=[""]
}

variable "health_check"{
    type=string
    default="ELB"
}

variable "health_grace_per"{
    type=number
    default=300
}

variable "tar_grp_pri"{
    type=any
    default=[""]
}

variable "tar_grp_pub"{
    type=any
    default=[""]
}

# variable "launch_config_pri"{
#     description="Launch Config for Private ASG"
#     type=string
#     default="aws_launch_configuration.private_lc.name"
# }

# variable "launch_config_pub"{
#     description="Launch Config for Public ASG"
#     type=string
#     default="aws_launch_configuration.public_lc.name"
# }