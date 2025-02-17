provider "aws" {
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/TerraformAdmin"
  }

  default_tags {
    tags = {
      managed_by_terraform = true
      repository           = "https://github.com/kasaconnect/kasa-infrastructure"
    }
  }
}

provider "aws" {
  region = var.region
  alias  = "kasa-SUS"

  assume_role {
    role_arn = "arn:aws:iam::471112800881:role/TerraformAdmin"
  }

  default_tags {
    tags = {
      managed_by_terraform = true
      repository           = "https://github.com/kasaconnect/kasa-infrastructure"
    }
  }
}

