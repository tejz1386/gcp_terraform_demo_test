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
  env_type = {
    default = "default"
    development   = "development"
    staging       = "staging"
    production    = "production"
  }
  env  = "${lookup(local.env_type, "development")}"

  subnetname_env =  {
    default       = "subnet-development"
    development   = "subnet-development"
    staging       = "subnet-staging"
    production    = "subnet-production"

  }
  subnetname = "${lookup(local.subnetname_env, local.env)}"
  csv_input_filename_env = {
    default       = "./gcp_server_input.csv"
    development   = "./development/gcp_server_input.csv"
    staging       = "./staging/gcp_server_input.csv"
    production    = "./production/gcp_server_input.csv"

  }
  csv_input_filename = "${lookup(local.csv_input_filename_env, local.env)}"


}
