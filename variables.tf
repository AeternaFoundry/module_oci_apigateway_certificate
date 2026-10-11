variable "apigateway_certificates" {
  description = <<EOT
Map of apigateway_certificates, attributes below
Required:
    - certificate
    - compartment_id
    - private_key
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - intermediate_certificates
    - is_lock_override
    - locks (block):
        - message (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    certificate               = string
    compartment_id            = string
    private_key               = string
    defined_tags              = optional(map(string))
    display_name              = optional(string)
    freeform_tags             = optional(map(string))
    intermediate_certificates = optional(string)
    is_lock_override          = optional(bool)
    locks = optional(list(object({
      message = optional(string)
      type    = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

