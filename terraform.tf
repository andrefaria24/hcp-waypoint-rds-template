terraform {
  required_version = "~>1.12.0"

  cloud {
    organization = "acfaria-hashicorp"

    workspaces {
      name = "hcp-waypoint-rds-template"
    }
  }

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.109.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.68.2"
    }
  }
}