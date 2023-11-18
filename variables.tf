# Variables
variable "ami" {
  type    = map
  default = {
    "us-east-1" = "ami-0df435f331839b2d6"
    "us-west-1" = "ami-0df435f331839b2d6"
    "us-west-2" = "ami-0df435f331839b2d6"
    # Add more regions and AMI IDs as needed
  }
}

variable "instance_types" {
  type    = list
  default = ["t2.micro", "t3.micro", "t3.small"]
}

variable "security_groups" {
  description = "A map of security groups with their rules"
  type = map(object({
    description = string
    ingress_rules = optional(list(object({
      description = optional(string)
      priority    = optional(number)
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })))
    egress_rules = list(object({
      description = optional(string)
      priority    = optional(number)
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}