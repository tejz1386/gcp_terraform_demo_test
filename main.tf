# module "app_vm_build_3_disks" {
#   source = "./modules/app_vm_build_3_disks"
#   csv_input_file_name = "./development/gcp_server_input_3_disks.csv"
#   subnetwork = "subnet-development"
# }
# module "app_vm_build_4_disks" {
#   source = "./modules/app_vm_build_4_disks"
#   csv_input_file_name = "./development/gcp_server_input_4_disks.csv"
#   subnetwork = "subnet-development"
# }
# module "app_vm_build_test" {
#   source = "./modules/app_vm_build_test"
#   csv_input_storage_file_name = "./development/gcp_storage_input_test_disks.csv"
#   csv_input_file_name = "./development/gcp_server_input_test_disks.csv"
#   os_image = "windows-2016"
#   # subnetwork = "subnet-development"
# }
# module "hana_vm_build_test" {
#   source = "./modules/hana_vm_build_test"
#   csv_input_storage_file_name_linux = "./development/gcp_storage_input_test_disks_linux.csv"
#   csv_input_file_name_linux = "./development/gcp_server_input_test_disks_linux.csv"
#   os_image = "centos-7"
#   # subnetwork = "subnet-development"
# }

module "module_1" {
  source  = "app.terraform.io/bso-cloud-03/module_1/google"
  version = "1.0.0"
  csv_input_storage_file_name = "./development/gcp_storage_hana_details.csv"
  csv_input_file_name = "./development/gcp_server_hana_details.csv"
}