variable "project_id" {
  default = "__project_id__"
}

variable "region" {
  default = "__region__"
}

variable "sa_account_id" {
  default = "__sa_account_id__"
}

variable "sa_display_name" {
  default = "__sa_name__"
}

variable "vm_name" {
  default = "__name_name__"
}

variable "machine_type" {
  default = "__machine_type__"
}

variable "zone" {
  default = "__zone__"
}

variable "boot_disk_image" {
  default = "__boot_disk_image__"
}
variable "credentials" {
  default   = "__GOOGLE_APPLICATION_CREDENTIALS__"
  type      = map(any)
  sensitive = true
}
