provider "hcp" {
  client_id     = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}

provider "tfe" {
  token = var.TFE_TOKEN
}