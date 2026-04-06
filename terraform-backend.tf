terraform {
  backend "s3" {
    bucket = "terraform-state-ydin"
    key    = "ydin.terraform.tfstate"
    region = "auto"

    # R2 S3-compatible endpoint — account ID and credentials are passed
    # via -backend-config flags in the workflow (see terraform.yml)
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    force_path_style            = true
  }
}
