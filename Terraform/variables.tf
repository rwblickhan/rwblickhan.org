variable "aws_region" {
  type        = string
  description = "The AWS region to put the bucket into"
  default     = "us-west-2"
}

variable "site_domain" {
  type        = string
  description = "The domain name to use for the static site"
  default     = "rwblickhan.org"
}
