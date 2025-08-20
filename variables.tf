variable "HCP_CLIENT_ID" {
  type      = string
  sensitive = true
}

variable "HCP_CLIENT_SECRET" {
  type      = string
  sensitive = true
}

variable "TFE_TOKEN" {
  type      = string
  sensitive = true
}

variable "TFE_ORG_NAME" {
  type = string
}

variable "TFE_PROJECT_DEST" {
  type    = string
  default = "Temporary Resources"
}