#--------------------------------------------------------------
# Route 53 Records
#--------------------------------------------------------------
resource "aws_route53_record" "main" {
  zone_id = var.route53_zone_id
  name    = var.route53_domain_name
  type    = "A"

  alias {
    name                   = aws_api_gateway_domain_name.api.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.api.regional_zone_id
    evaluate_target_health = true
  }
}