resource "aws_launch_configuration" "private_lc" {
  name_prefix   = "Private Launch Config"
  image_id      = var.inst_imageid_pri
  instance_type = var.inst_type
  lifecycle {
    create_before_destroy = true
  }
 # depends_on = [aws_instance.private_ec2]
}

resource "aws_autoscaling_group" "internal_as" {
  name                 = "Private EC2 Auto Scailing"
  min_size             = var.min_size
  max_size             = var.max_size
  #availability_zones = ["us-east-1a","us-east-1b"]
  vpc_zone_identifier   = var.zone_ide_pri
  health_check_type = var.health_check
  health_check_grace_period = var.health_grace_per
  target_group_arns     = [var.tar_grp_pri]
  launch_configuration = aws_launch_configuration.private_lc.name
  lifecycle {
    create_before_destroy = true
  }
 # depends_on = [aws_instance.private_ec2]
}

resource "aws_launch_configuration" "public_lc" {
  name_prefix   = "Public Launch Config"
  image_id     = var.inst_imageid_pub
  instance_type = var.inst_type
  associate_public_ip_address = var.public_ip
  lifecycle {
    create_before_destroy = true
  }
 # depends_on = [aws_instance.public_ec2]
}

resource "aws_autoscaling_group" "external_as" {
  name                 = "Public EC2 Auto Scailing"
  launch_configuration  = aws_launch_configuration.public_lc.name
  min_size             = var.min_size
  max_size             = var.max_size
  #availability_zones   = ["us-east-1a","us-east-1b"]
  vpc_zone_identifier   = var.zone_ide_pub
  health_check_type = var.health_check
  health_check_grace_period = var.health_grace_per
  target_group_arns     = [var.tar_grp_pub]
  lifecycle {
    create_before_destroy = true
  }
 # depends_on = [aws_instance.public_ec2]
}
