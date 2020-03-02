locals {
  instances = "${csvdecode(file(var.csv_input_file_name))}"
}
# module "csv_output" {
#   source = "../csv_output"
#   csv_input_file_name = "${var.csv_input_file_name}"
# }
resource "google_compute_disk" "testdisk" {
  for_each      = { for inst in local.instances : inst.server_name => inst }
      name  = "${each.value.server_name}-${var.disk_number}"
      size  = var.server_size[each.key]
      type  = "pd-ssd"
      zone  = each.value.zone
    labels = {
      environment = "development"
    }
    physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "attachdisk" {
  for_each      = { for inst in local.instances : inst.server_name => inst }
    disk     =  google_compute_disk.testdisk[each.key].self_link
    instance = each.value.server_name
    zone = each.value.zone
}