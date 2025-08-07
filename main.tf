data "tfe_project" "destination" {
  name         = "Temporary Resources"
  organization = var.TFE_ORG_NAME
}

data "tfe_registry_module" "rds" {
  organization    = var.TFE_ORG_NAME
  name            = "rds"
  module_provider = "aws"
}

resource "hcp_waypoint_template" "rds" {
  name                            = "rds-template"
  summary                         = "RDS Postgres database"
  description                     = "Deploys an RDS Postgres database"
  terraform_project_id            = data.tfe_project.destination.id
  terraform_no_code_module_source = data.tfe_registry_module.rds.no_code_module_source
  terraform_no_code_module_id     = data.tfe_registry_module.rds.no_code_module_id

  variable_options = [
    {
      name          = "db_name"
      user_editable = true
      variable_type = "string"
    },
    {
      name          = "db_username"
      user_editable = true
      variable_type = "string"
    },
    {
      name          = "instance_class"
      user_editable = false
      options       = ["db.r6g.large", "db.r6g.xlarge", "db.r6g.2xlarge"]
    },
    {
      name          = "region"
      user_editable = false
      options       = ["us-east-1", "us-east-2", "us-west-2", "eu-west-1"]
    },
  ]
}