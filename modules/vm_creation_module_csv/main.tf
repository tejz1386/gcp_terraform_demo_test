locals {
  instances = "${csvdecode(file(var.csv_input_file_name))}"
}
module "csv_output" {
  source = "../csv_output"
  csv_input_file_name = "${var.csv_input_file_name}"
}
resource "google_compute_address" "internal_with_subnet_and_address" {
  for_each      = { for inst in local.instances : inst.server_name => inst }
    name         = "${each.value.server_name}-dataip"
    subnetwork   = var.subnetwork
    address_type = "INTERNAL"
    address      = each.value.ipaddr
    region       = each.value.location
}

resource "google_compute_instance" "instancecreationcsv" {
  for_each      = { for inst in local.instances : inst.server_name => inst }
  name          = each.value.server_name
  machine_type  = "${lookup(each.value.machine_type, "${var.machine_type_size}")}"
  zone          = each.value.zone
  tags = ["foo", "bar"]
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "${lookup(each.value.instance_type, "${var.instance_type_size}")}"
    }
  }
  network_interface {
    subnetwork = var.subnetwork
    network_ip = each.value.ipaddr
    alias_ip_range {
      ip_cidr_range = each.value.backup-ip
    }
  }
  lifecycle {
    ignore_changes = [attached_disk]
  }
  metadata = {
    foo = "bar"
  }
  metadata_startup_script = "echo hi > /test.txt"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}