module "app_vm_build" {
  source = "./modules/app_vm_build"
  csv_input_file_name = "./development/gcp_server_input.csv"
  subnetwork = "subnet-development"
}