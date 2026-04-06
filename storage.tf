resource "cloudflare_r2_bucket" "data" {
  account_id = var.cloudflare_account_id
  name       = "${var.project}-${var.storage_container_name}-${var.environment}"
  location   = "WEUR"
}
