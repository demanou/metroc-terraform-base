locals {
    ssm_parameters_name = {
        vpc_id = "/metroc/vpc/id"
        subnet1_id = "/metroc/subnet1/id"
        subnet2_id = "/metroc/subnet2/id"
        subnet3_id = "/metroc/subnet3/id"
        subnet4_id = "/metroc/subnet4/id"
        alb_sg_id = "/metroc/alb/sg/id"
        ec2_sg_id = "/metroc/ec2/sg/id"
    }
}

data "aws_ssm_parameter" "customVPCParameters" {
  for_each = local.ssm_parameters_name
  name     = each.value
}

