variable "prefix" {
       default = "harisatyaCorp"
}

variable "location" {
      default = "east us"
}

variable "vnet_cidr_block"{
      default = ["10.0.0.0/16"]
}

variable "subnet_cidr"{
      default = "10.0.1.0/24"
}

variable "node_count"{
      default = 2
}

variable "vm_size" {
    default = "Standard_B1s"
}

variable "admin_username" {
    default = "webadmin"
}

variable "frontend_name" {
  description = "(Required) Specifies the name of the frontend ip configuration."
  default     = "myPublicIP"
}

variable "remote_port" {
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  default     = {}
}

variable "lb_port" {
  description = "Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port]"
  default     = {}
}

variable "lb_probe_unhealthy_threshold" {
  description = "Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy."
  default     = 2
}

variable "lb_probe_interval" {
  description = "Interval in seconds the load balancer health probe rule does a check"
  default     = 5
}

variable "type" {
  type        = "string"
  description = "(Optional) Defined if the loadbalancer is private or public"
  default     = "public"
}
