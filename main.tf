module "app_vm_build" {
  source = "./modules/app_vm_build"
  csv_input_filename = "./development/gcp_server_input.csv"
}