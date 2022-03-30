variable "resourcename" {
  type        = string
  description = "RG"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "clustername" {
  type        = string
  description = "K8s cluster"
}

variable "nodecount" {
  type        = number
  description = "node count"
}

variable "vmsize" {
  type        = string
  description = "VM size"
}

variable "osdisk" {
  type        = number
  description = "OS Disk"
}

variable "identitytype" {
  type        = string
  description = "Identity type"
}

# variable "rbac" {
#   type        = bool
#   description = "rbac"
# }

