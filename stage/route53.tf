resource "aws_route53_record" "api" {
  zone_id = var.route53_zone_id
  name    = "api-stage.${var.domain}"
  type    = "A"

  alias {
    name                   = aws_alb.api.dns_name
    zone_id                = aws_alb.api.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "web" {
  zone_id = var.route53_zone_id
  name    = var.web_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.web_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.web_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}
