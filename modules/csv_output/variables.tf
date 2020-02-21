variable "csv_input_file_name" {}
variable "machine_type_size" {
    type = map
default = {
    small   = "n1-standard-1"
    medium  = "n1-standard-1"
    large   = "n1-standard-1"
    }
  }
variable "instance_type_size" {
    type = map
default = {
    hana   ="centos-7"
    sql    ="windows-2016"
    app    ="windows-2016"
    }
  }