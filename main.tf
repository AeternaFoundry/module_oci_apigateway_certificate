resource "oci_apigateway_certificate" "apigateway_certificates" {
  for_each = var.apigateway_certificates

  certificate               = each.value.certificate
  compartment_id            = each.value.compartment_id
  private_key               = each.value.private_key
  defined_tags              = each.value.defined_tags
  display_name              = each.value.display_name
  freeform_tags             = each.value.freeform_tags
  intermediate_certificates = each.value.intermediate_certificates
  is_lock_override          = each.value.is_lock_override

  dynamic "locks" {
    for_each = each.value.locks != null ? each.value.locks : []
    content {
      message = locks.value.message
      type    = locks.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

