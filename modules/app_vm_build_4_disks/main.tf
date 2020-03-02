module "csv_output" {
  source = "../csv_output"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  csv_input_file_name = "${var.csv_input_file_name}"
}
module "vm_creation_module_csv" {
  source = "../vm_creation_module_csv"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
  subnetwork          = "${var.subnetwork}"
}
module "disk_creation_1" {
  source = "../disk_creation_2"
  server_size =  module.csv_output.server_disk1_consolidation
  disk_number = "disk-01"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
}
module "disk_creation_2" {
  source = "../disk_creation_2"
  server_size =  module.csv_output.server_disk2_consolidation
  disk_number = "disk-02"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
}
module "disk_creation_3" {
  source = "../disk_creation_2"
  server_size =  module.csv_output.server_disk3_consolidation
  disk_number = "disk-03"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
}
module "disk_creation_4" {
  source = "../disk_creation_2"
  server_size =  module.csv_output.server_disk4_consolidation
  disk_number = "disk-04"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
}
module "network_creation" {
  source = "../network_creation"
  # csv_input_file_name = module.shared_vars.csv_input_filename
  # csv_input_file_name = "${var.csv_input_file_name}"
  subnetwork = "${var.subnetwork}"
}