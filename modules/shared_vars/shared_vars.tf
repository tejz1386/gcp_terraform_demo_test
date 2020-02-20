output "subnetname" {
  value = "${local.subnetname}"
}
output "env_suffix" {
  value = "${local.env}"
}
output "csv_input_filename" {
  value = "${local.csv_input_filename}"
}

locals {
  env  = "${lookup(var.env_type, "development")}"
  subnetname = "${lookup(var.subnetname_env, local.env)}"
  csv_input_filename = "${lookup(var.csv_input_filename_env, local.env)}"


}
