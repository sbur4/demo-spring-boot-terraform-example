variable "public_key_path" {
  description = "Path to the public key file for EC2 instance access"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file for SSH into the machine"
  type        = string
}