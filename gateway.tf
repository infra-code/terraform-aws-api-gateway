#--------------------------------------------------------------
# API Gateway
#--------------------------------------------------------------

resource "aws_api_gateway_rest_api" "api" {
  count = var.enabled == true ? 1 : 0
  name = var.rest_api_name
}

resource "aws_api_gateway_domain_name" "api" {
  count = var.enabled == true ? 1 : 0
  domain_name = var.route53_domain_name

  regional_certificate_arn = var.certificate_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}