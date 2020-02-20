variable "credentials" {}
variable "env" {} 
variable "subnetname" {}
variable "csv_input_filename" {}
variable "env_type" {
    type = map
default = {
    development   = "development"
    staging       = "staging"
    production    = "production"
}
  }

  env  = "${lookup(var.env_type, "development")}"
variable "subnetname_env" {
    type = map
default = {
    development   = "subnet-development"
    staging       = "subnet-staging"
    production    = "subnet-production"
}
  }
  subnetname = "${lookup(var.subnetname_env, var.env)}"
variable "csv_input_filename_env" {
    type = map
default = {
    development   = "./development/gcp_server_input.csv"
    staging       = "./staging/gcp_server_input.csv"
    production    = "./production/gcp_server_input.csv"
    }
  }
  csv_input_filename = "${lookup(var.csv_input_filename_env, var.env)}"