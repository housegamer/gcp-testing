variable "project_id" {
  default = "project_id"
}

variable "region" {
  default = "region"
}

variable "sa_account_id" {
  default = "sa_account_id"
}

variable "sa_display_name" {
  default = "sa_display_name"
}

variable "vm_name" {
  default = "vm_name"
}

variable "machine_type" {
  default = "machine_type"
}

variable "zone" {
  default = "zone"
}

variable "boot_disk_image" {
  default = "boot_disk_image"
}
variable "credentials" {
  default   = "GOOGLE_APPLICATION_CREDENTIALS"
#   type      = map(any)
  sensitive = true
}
