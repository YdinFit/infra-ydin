resource "cloudflare_r2_bucket" "data" {
  account_id = var.cloudflare_account_id
  name       = "${var.project}-${var.storage_container_name}-${var.environment}"
  location   = "WEUR"
}

resource "cloudflare_r2_custom_domain" "catalog" {
  account_id  = var.cloudflare_account_id
  bucket_name = cloudflare_r2_bucket.data.name
  zone_id     = var.cloudflare_zone_id
  domain      = "catalog.ydin.app"
  enabled     = true
}
