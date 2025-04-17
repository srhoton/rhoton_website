variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for the CloudFront distribution"
  type        = string
  default     = "arn:aws:acm:us-east-1:705740530616:certificate/84718bd2-659b-4c26-8c1c-a50210e5041c"
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID for the domain"
  type        = string
  default     = "Z0738030YKODO2ZBZ8JM"
}
