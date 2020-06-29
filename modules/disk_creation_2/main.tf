locals {
  instances = "${csvdecode(file(var.csv_input_file_name))}"
}
resource "google_compute_disk" "testdisk" {
  for_each      = { for inst in local.instances : inst.gcp_vm_name => inst }
      name  = "${each.value.server_name}-${var.disk_number}"
      size  = var.server_size[each.key]
      type  = var.disk_type
      zone  = each.value.gcp_zone
    labels = {
      environment = each.value.gcp_tier
    }
    physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "attachdisk" {
  for_each      = { for inst in local.instances : inst.gcp_vm_name=> inst }
    disk     =  google_compute_disk.testdisk[each.key].self_link
    instance = each.value.gcp_vm_name
    zone = each.value.gcp_zone
}