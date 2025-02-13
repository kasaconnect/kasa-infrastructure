terraform {
  backend "s3" {
    region               = "us-east-1"
    bucket               = "kasa-terraform-state-bucket"
    dynamodb_table       = "kasa-terraform-state-lock"
    role_arn             = "arn:aws:iam::471112800881:role/TerraformAdmin"
    workspace_key_prefix = "environment"
    use_path_style       = true
    encrypt              = true
  }
}
