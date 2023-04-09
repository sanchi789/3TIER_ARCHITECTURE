# variable "policy_name" {
#   type        = string
#   default     = "S3-Bucket-Access-Policy"
#   description = "Policy Name"
# }

# variable "policy_des"{
#     type=string
#     default="Provides permission to access S3"
# }

# variable "role_name"{
#     type=string
#     description="Role Name"
#     default="threetierrole"
# }

# variable "policy_att"{
#     type=string
#     default="policy_attachment"
# }

# variable "policy_role"{
#     description="IAM Policy Attachment Role"
#     type=any
#     default=["aws_iam_role.threetierrole.name"]
# }

# variable "policy_arn"{
#     type=string
#     default="aws_iam_policy.s3_policy.arn"
# }

# variable "inst_prof"{
#     type=string
#     description="Profile Name"
#     default="private_profile"
# }

# variable "profile_role"{
#     type=string
#     default="aws_iam_role.threetierrole.name"
# }

# variable "aws_ami_pri" {
#   type        = string
#   default     = "data.aws_ami.aws_linux.id"
#   description = "AWS AMI ID"
# }

# variable "aws_ami_pub" {
#   type        = string
#   default     = "data.aws_ami.aws_linux.id"
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

variable "vpc_sg_pri"{
    description="VPC SG for private"
    type= set(string)
    default= [""]
}

variable "vpc_sg_pub"{
    description="VPC SG for public"
    type=any
    default= [""]
}

# variable "iam_inst"{
#     description="IAM Role for Insstances"
#     type=string
#     default="aws_iam_instance_profile.private_profile.name"
# }

variable "pri_sub"{
    description="Private Subnet for EC2"
    type=string
    default=""
}

variable "pub_sub"{
    description="Public Subnet for EC2"
    type=string
    default=""
}

# variable "public_ip"{
#     type=bool
#     default=true
# }