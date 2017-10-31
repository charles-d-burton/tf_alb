output "internal_alb_arn" {
  value = "${aws_lb.internal_alb.arn}"
}

output "internal_alb_arn_suffix" {
  value = "${aws_lb.internal_alb.arn_suffix}"
}

output "internal_alb_dns_name" {
  value = "${aws_lb.internal_alb.dns_name}"
}

output "internal_canonical_hosted_zone_id" {
  value = "${aws_lb.internal_alb.canonical_hosted_zone_id}"
}

output "internal_zone_id" {
  value = "${aws_lb.internal_alb.zone_id}"
}

output "external_alb_arn" {
  value = "${aws_lb.external_alb.arn}"
}

output "external_alb_arn_suffix" {
  value = "${aws_lb.external_alb.arn_suffix}"
}

output "external_alb_dns_name" {
  value = "${aws_lb.external_alb.dns_name}"
}

output "external_canonical_hosted_zone_id" {
  value = "${aws_lb.external_alb.canonical_hosted_zone_id}"
}

output "external_zone_id" {
  value = "${aws_lb.external_alb.zone_id}"
}
