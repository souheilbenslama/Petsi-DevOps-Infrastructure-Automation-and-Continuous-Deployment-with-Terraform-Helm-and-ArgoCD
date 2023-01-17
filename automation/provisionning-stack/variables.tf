variable "resource_group_name"{
  type = string
  description = "Resource Group Name"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "statebackend_container_name"{
  type = string
  description = "state container Name"
}


variable "resource_group_location"{
  type = string
  description = "Resource Group Location"
}