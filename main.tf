module "app_vm_build" {
  source = "./modules/app_vm_build_3_disks"
  csv_input_file_name = "./development/gcp_server_input_3_disks.csv"
  subnetwork = "subnet-development"
}
module "app_vm_build" {
  source = "./modules/app_vm_build_4_disks"
  csv_input_file_name = "./development/gcp_server_input_4_disks.csv"
  subnetwork = "subnet-development"
}