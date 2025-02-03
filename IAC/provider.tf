provider "aws" {
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/TerraformAdmin"
  }

  default_tags {
    tags = {
      managed_by_terraform = true
      repository           = "https://github.com/kasaconnect/kasa-infrastructure.git"
    }
  }
}

provider "aws" {
  region = var.region
  alias  = "shared-services"

  assume_role {
    role_arn = "arn:aws:iam::026090519216:role/TerraformAdmin"
  }

  default_tags {
    tags = {
      managed_by_terraform = true
      repository           = "https://github.com/kasaconnect/kasa-infrastructure.git"
    }
  }
}