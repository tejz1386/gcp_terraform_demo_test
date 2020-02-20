variable "credentials" {}
variable "env" {} 
variable "subnetname" {}
variable "csv_input_filename" {}
env_type {
    default       = "development"
    development   = "development"
    staging       = "staging"
    production    = "production"
  }
  env  = "${lookup(local.env_type, "development")}"
subnetname_env {
    default       = "subnet-development"
    development   = "subnet-development"
    staging       = "subnet-staging"
    production    = "subnet-production"
  }
  subnetname = "${lookup(local.subnetname_env, local.env)}"
csv_input_filename_env {
    default       = "./development/gcp_server_input.csv"
    development   = "./development/gcp_server_input.csv"
    staging       = "./staging/gcp_server_input.csv"
    production    = "./production/gcp_server_input.csv"

  }
  csv_input_filename = "${lookup(local.csv_input_filename_env, local.env)}"