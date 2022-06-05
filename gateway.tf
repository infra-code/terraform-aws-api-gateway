#--------------------------------------------------------------
# API Gateway
#--------------------------------------------------------------

resource "aws_api_gateway_rest_api" "api" {
  name = var.rest_api_name
}

resource "aws_api_gateway_domain_name" "api" {
  domain_name = var.route53_domain_name

  regional_certificate_arn = var.certificate_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}