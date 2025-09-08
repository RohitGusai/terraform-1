variable "vpc_config" {
    description = "Please provide the VPC name and CIDR Block "
    type = object({
        name = string
        cidr_block = string
    })
    validation {
      condition = can(cidrnetmask(var.vpc_config.cidr_block))
      error_message = "Invalid CIDR Format ${var.vpc_config.cidr_block}"
    }
}

variable "subnet_config" {
    # "" = {cidr,name}
    type = map(object({
      cidr_block = string
      az = string
      public = optional(bool,false)
    }))

    validation {
      condition = alltrue([for j in var.subnet_config: can(cidrnetmask(j.cidr_block)) ])
      error_message = "Invalid CIDR Format"
    }
}