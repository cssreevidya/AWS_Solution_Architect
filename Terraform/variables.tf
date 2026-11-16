variable "aws_region" {
    description = "The AWS region to deploy resources in"
   type        = string   
  
}
variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string
}
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "Whether versioning is enabled"
  type        = bool
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
}

variable "block_public_acls" {
  description = "Whether to block public ACLs"
  type        = bool
}

variable "block_public_policy" {
  description = "Whether to block public policies"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Whether to ignore public ACLs"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Whether to restrict public buckets"
  type        = bool
}
