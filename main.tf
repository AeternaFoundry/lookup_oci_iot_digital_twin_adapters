data "oci_iot_digital_twin_adapters" "iot_digital_twin_adapters_lookup" {
  for_each = var.iot_digital_twin_adapters_lookup

  iot_domain_id               = each.value.iot_domain_id
  digital_twin_model_id       = each.value.digital_twin_model_id
  digital_twin_model_spec_uri = each.value.digital_twin_model_spec_uri
  display_name                = each.value.display_name
  state                       = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

