provider "vsphere" {
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vcenter_server

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

locals {
  date = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
}

module "domain-controllers" {
  source               = "Terraform-VMWare-Modules/vm/vsphere"
  version              = "3.4.1"
  cpu_number           = var.num_cpus
  num_cores_per_socket = var.num_cores_per_socket
  cpu_hot_add_enabled  = var.cpu_hot_add_enabled
  ram_size             = var.memory
  instances            = var.instances
  dc                   = var.datacenter
  vmrp                 = "${var.cluster}/Resources"
  vmfolder             = var.folder
  datastore            = var.datastore
  vmtemp               = var.template
  vmname               = var.vm_name_prefix
  vmnameformat         = var.vm_name_format #To use three decimal with leading zero vmnames will be AdvancedVM001,AdvancedVM002
  #domain            = "somedomain.com"
  network = {
    "VM Network" = var.ipv4_address # To use DHCP create Empty list ["",""]; You can also use a CIDR annotation;
  }
  ipv4submask  = var.ipv4_netmask
  network_type = ["vmxnet3"]

  scsi_type       = "pvscsi" // Other acceptable value "pvscsi"
  scsi_controller = 0        // This will assign OS disk to controller 0
  dns_server_list = var.dns_server_list
  vmgateway       = var.ipv4_gateway
  auto_logon      = var.autologon
  #run_once         = ["command01", "command02"] // You can also run Powershell commands
  orgname              = var.organization_name
  workgroup            = var.workgroup
  is_windows_image     = true
  firmware             = var.firmware
  local_adminpass      = var.admin_password
  force_power_off      = false
  annotation           = var.annotation
  migrate_wait_timeout = var.migrate_wait_timeout
}

output "vmnames" {
  value = module.domain-controllers.VM
}

output "vmnameswip" {
  value = module.domain-controllers.ip
}