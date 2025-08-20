data "tfe_project" "destination" {
  name         = var.TFE_PROJECT_DEST
  organization = var.TFE_ORG_NAME
}

data "tfe_registry_module" "aurora-postgresql" {
  organization    = var.TFE_ORG_NAME
  name            = "aurora-postgresql"
  module_provider = "aws"
}

resource "hcp_waypoint_template" "aurora-postgresql" {
  name                            = "aurora-postgresql-db"
  summary                         = "Aurora Postgresql database"
  description                     = "Deploys an Amazon Aurora Postgresql database"
  terraform_project_id            = data.tfe_project.destination.id
  terraform_no_code_module_source = data.tfe_registry_module.aurora-postgresql.no_code_module_source
  terraform_no_code_module_id     = data.tfe_registry_module.aurora-postgresql.no_code_module_id

  variable_options = [
    {
      name          = "db_name"
      user_editable = true
      variable_type = "string"
    },
    {
      name          = "db_admin"
      user_editable = true
      variable_type = "string"
    },
  ]
}