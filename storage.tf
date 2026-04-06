resource "cloudflare_r2_bucket" "data" {
  account_id = var.cloudflare_account_id
  name       = "${var.project}-${var.storage_container_name}-${var.environment}"
  location   = "WEUR"
}

resource "cloudflare_r2_bucket_domain" "catalog" {
  account_id  = var.cloudflare_account_id
  bucket_name = cloudflare_r2_bucket.data.name
  zone_id     = var.cloudflare_zone_id
  domain      = "catalog.ydin.app"
}

resource "cloudflare_ruleset" "r2_access_control" {
  zone_id     = var.cloudflare_zone_id
  name        = "R2 path access control"
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    description = "Only allow /public/ folder on catalog.ydin.app"
    expression  = "(http.host eq \"catalog.ydin.app\" and not starts_with(http.request.uri.path, \"/public/\"))"
    enabled     = true
  }
}
