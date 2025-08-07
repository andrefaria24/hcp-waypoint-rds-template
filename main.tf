data "tfe_project" "destination" {
  name = "Temporary Resources"
  organization = var.TFE_ORG_NAME
}

data "tfe_registry_module" "rds" {
  organization    = var.TFE_ORG_NAME
  name            = "rds"
  module_provider = "aws"
}

resource "hcp_waypoint_template" "rds" {
    name = "rds-template"
    summary = "RDS Postgres database"
    description = "Deploys an RDS Postgres database"
    terraform_project_id = data.tfe_project.destination.id
    terraform_no_code_module_source = data.tfe_registry_module.rds.no_code_module_source
    terraform_no_code_module_id = data.tfe_registry_module.rds.no_code_module_id
}