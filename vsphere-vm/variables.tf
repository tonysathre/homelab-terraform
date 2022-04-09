variable "instances" {
  type = number
}

variable "vcenter_server" {
  type = string
}

variable "vcenter_user" {
  type      = string
  sensitive = true
}

variable "vcenter_password" {
  type      = string
  sensitive = true
}

variable "datacenter" {
  type = string
}

variable "datastore" {
  type = string
}

variable "cluster" {
  type = string
}

variable "folder" {
  type = string
}

variable "network" {
  type = string
}

variable "template" {
  type = string
}

variable "num_cpus" {
  type = number
}

variable "num_cores_per_socket" {
  type = number
}

variable "cpu_hot_add_enabled" {
  type    = bool
  default = false
}

variable "memory" {
  type = number
}

variable "firmware" {
  type = string
}

variable "guest_id" {
  type = string
}

variable "vm_name_prefix" {
  type = string
}

variable "vm_name_format" {
  type = string
}

variable "hostname" {
  type = string
}

variable "workgroup" {
  type = string
}

variable "organization_name" {
  type = string
}

variable "time_zone" {
  type = number
}

variable "autologon" {
  type = bool
}

variable "admin_password" {
  type = string
}

variable "ipv4_address" {
  type = list(any)
}

variable "ipv4_netmask" {
  type = list(string)
}

variable "ipv4_gateway" {
  type = string
}

variable "dns_server_list" {
  type = list(any)
}

variable "dns_domain" {
  type = string
}

variable "annotation" {
  type = string
}

variable "force_power_off" {
  type    = bool
  default = false
}

variable "migrate_wait_timeout" {
  type = string
}