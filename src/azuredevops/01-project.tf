
locals {
  azure_devops_org = "pagopaspa"
}

resource "azuredevops_project" "this" {
  name               = "test-deploy-ecs-projects"
  description        = "DevOps project for aws user registry"
  visibility         = "public"
  version_control    = "Git"
  work_item_template = "Basic"
}

resource "azuredevops_project_features" "features" {
  project_id = azuredevops_project.this.id
  features = {
    "boards"       = "disabled"
    "repositories" = "disabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}