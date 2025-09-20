variable "esxi_host" {
    description = "The IP/FQDN of the esxi host"
    type = string
    default = "192.168.178.20"
}
variable "esxi_user" {
    description = "The user of the ESXI host"
    type = string
    default = "root"
}
variable "esxi_password" {
    sensitive = true
    description = "The password of the ESXI user"
    type = string
    default = "Infra123#"
}
variable "disk_store" {
    description = "The datastore that the VMs wil use"
    type = string
    default = "datastore1"
}
variable "virtual_network" {
    type = string
    description = "The network the VM wil use"
    default = "VM Network"
}
variable "ubuntu_image_url" {
    type = string
    description = "A URL/path to the OVA source for the VM"
    default = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"
}
variable "ssh_public_key_path" {
    type = string
    description = "The path to the public ssh key"
    default = "~/.ssh/terraform.pub"
}