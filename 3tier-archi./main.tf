module "vpc" {
    source  = "./Modules/vpc"
    vpc_cidr=var.vpc_cidr
    # sub_vpc_id=var.sub_vpc_id
    az_1=var.az_1
    az_2=var.az_2
    pub_sub_cidr_1=var.pub_sub_cidr_1
    pri_sub_cidr_1=var.pri_sub_cidr_1
    pub_sub_cidr_2=var.pub_sub_cidr_2
    pri_sub_cidr_2=var.pri_sub_cidr_2
    pri_sub_cidr_3=var.pri_sub_cidr_3
    pri_sub_cidr_4=var.pri_sub_cidr_4
    # Elastic_IP=var.Elastic_IP
    # nat_allocation_id_1=var.nat_allocation_id_1
    # nat_sub_id_1=var.nat_sub_id_1
    # nat_allocation_id_2=var.nat_allocation_id_2
    # nat_sub_id_2=var.nat_sub_id_2
    # route_table_IG_id=var.route_table_IG_id
    route_table_cidr=var.route_table_cidr
    # route_nat_id_1=var.route_nat_id_1
    # route_nat_id_2=var.route_nat_id_2
    # rt_assoc_pubsub_1=var.rt_assoc_pubsub_1
    # rt_assoc_pubsub_2=var.rt_assoc_pubsub_2
    # rt_assoc_rtid_pub=var.rt_assoc_rtid_pub
    # rt_assoc_prisub_1=var.rt_assoc_prisub_1
    # rt_assoc_rtid_priv=var.rt_assoc_rtid_priv
    # rt_assoc_prisub_2=var.rt_assoc_prisub_2
    # rt_assoc_rtid_priv_1=var.rt_assoc_rtid_priv_1
    extern_sg_name=var.extern_sg_name
    extern_sg_des=var.extern_sg_des
    ing_from_to_port=var.ing_from_to_port
    egr_from_to_port=var.egr_from_to_port
    ingress_sg_protocol=var.ingress_sg_protocol
    egress_sg_protocol=var.egress_sg_protocol
    extern_cidr_sg=var.extern_cidr_sg
    self_ip=var.self_ip
    ipv6_cidr=var.ipv6_cidr
    intern_sg_name=var.intern_sg_name
    internal_description=var.internal_description
    internal_description_ingress=var.internal_description_ingress
    internal_cidr_blk=var.internal_cidr_blk
    intern_ingress_sg=var.intern_ingress_sg
    public_sg_name=var.public_sg_name
    public_sg_desc=var.public_sg_desc
    pub_ingr_sg=var.pub_ingr_sg
    private_sg_name=var.private_sg_name
    priv_description=var.priv_description
    priv_description_ingr=var.priv_description_ingr
    priv_ingr_sg=var.priv_ingr_sg
    dbms_sg_name=var.dbms_sg_name
    dbms_des=var.dbms_des
    dbms_des_ingr=var.dbms_des_ingr
    dbms_port=var.dbms_port
    dbms_ingr_sg=var.dbms_ingr_sg
    bast_sg_name=var.bast_sg_name
    bast_des=var.bast_des
    bast_des_ingr=var.bast_des_ingr
    bash_ssh_port=var.bash_ssh_port
}






module "ec2" {
    source  = "./Modules/ec2"
    # policy_name=var.policy_name
    # policy_des=var.policy_des
    # role_name=var.role_name
    # policy_att=var.policy_att
    # policy_role=var.policy_role
    # policy_arn=var.policy_arn
    # inst_prof=var.inst_prof
    # profile_role=var.profile_role
    # aws_ami_pri=var.aws_ami_pri
    # aws_ami_pub=var.aws_ami_pub
    inst_type=var.inst_type
    key_name=var.key_name
    monit_inst=var.monit_inst
    vpc_sg_pri=[module.vpc.Private_EC2_id]
    vpc_sg_pub=[module.vpc.Public_EC2_id]
    # iam_inst=var.iam_inst
    pri_sub=module.vpc.pri_sub_1_id
    pub_sub=module.vpc.pub_sub_1_id
    # public_ip=var.public_ip
}

module "lb" {
    source  = "./Modules/lb"
    # internal_name=var.internal_name
    # inter=var.inter
    lb_type=var.lb_type
    intern_lb_sg=module.vpc.internal_lb_sg_id
    intern_lb_sub=module.vpc.intern_lb_sub_id
    #intern_lb_tg_name=var.intern_lb_tg_name
    intern_lb_port=var.intern_lb_port
    intern_prot=var.intern_prot
    vpc_id=module.vpc.awsvpc_id
    #intern_tg_arn=var.intern_tg_arn
    intern_tg_id=module.ec2.pri_ec2_id
    # external_name=var.external_name
    # exter=var.exter
    extern_lb_sg=module.vpc.exernal_lb_sg_id
    extern_lb_sub = module.vpc.exernal_lb_sub_id
    extern_lb_tg_name=var.extern_lb_tg_name
    #extern_tg_arn=var.extern_tg_arn
    extern_tg_id=module.ec2.pub_ec2_id
    # intern_listener=var.intern_listener
    # extern_listener=var.extern_listener
    # intern_tg_listener=var.intern_tg_listener
    # extern_tg_listener=var.extern_tg_listener
}


module "asg" {
    source  = "./Modules/asg"
    # inst_name_pri=var.inst_name_pri
    # inst_name_pub=var.inst_name_pub
    inst_imageid_pri=module.ec2.pri_ec2_ami
    inst_imageid_pub=module.ec2.pub_ec2_ami
    inst_type=var.inst_type
    public_ip=var.public_ip
    # asg_name_pri=var.asg_name_pri
    # asg_name_pub=var.asg_name_pub
    min_size=var.min_size
    max_size=var.max_size
    zone_ide_pri=module.vpc.pri_sub_id
    zone_ide_pub=module.vpc.pub_sub_id
    health_check=var.health_check
    health_grace_per=var.health_grace_per
    tar_grp_pri=module.lb.pri_tg_arn
    tar_grp_pub=module.lb.pub_tg_arn
    # launch_config_pri=var.launch_config_pri
    # launch_config_pub=var.launch_config_pub
}


module "jumpser" {
    source  = "./Modules/jumpser"
    # aws_ami_bast_host_1=module.ec2.
    # aws_ami_bast_host_2=var.aws_ami_bast_host_2
    inst_type=var.inst_type
    key_name=var.key_name
    monit_inst=var.monit_inst
    bast_vpc_sg_pub=module.vpc.bast_sg
    pub_sub_1=module.vpc.pub_sub_1_id
    pub_sub_2=module.vpc.pub_sub_2_id
    public_ip=var.public_ip
}
module "rds" {
    source = "./Modules/rds"
    rds_sub_ids = module.vpc.rds_sub_ids
    vpc_sg = module.vpc.vpc_sg
    all_str = var.all_str
    max_all_str = var.all_str
    rds_engine = var.rds_engine
    rds_engine_ver = var.rds_engine_ver
    multi_azs = var.multi_azs
    rds_class = var.rds_class
    database_upasswd = var.database_upasswd
    strg_enc = var.strg_enc
    iam_auth = var.iam_auth
    skip_final = var.skip_final
}
module "s3" {
  source = "./Modules/s3"
}