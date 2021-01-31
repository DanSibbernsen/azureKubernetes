resource "azurerm_resource_group" "main" {
  name = local.resource_group
  location = local.location
  tags = {
    Environment = terraform.workspace
    Role        = "k8s-resourceGroup"
  }
}

module "kubernetes" {
  source = "./module-k8s"
  cluster_name = local.resource_group
  location = local.location
  resource_group = local.resource_group
  default_node_pool = local.default_node_pool
}
