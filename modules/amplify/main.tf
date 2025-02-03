# -----------------------------------------------------------------------------------------------------------
# AWS Amplify
# -----------------------------------------------------------------------------------------------------------

resource "aws_amplify_app" "main" {
  name                 = var.name
  repository           = var.repository_url
  oauth_token          = data.aws_ssm_parameter.token.value
  iam_service_role_arn = var.iam_service_role_arn

  # The default build_spec added by the Amplify Console for React.
  #build_spec = try(var.build_spec == null) ? file("${path.module}/buildspec.yaml") : null
  # build_spec = file("${path.module}/${var.buildspec_file}")
  build_spec = try(file("${path.module}/${var.buildspec_file}"), null)
  #platform   = "WEB_COMPUTE"
  platform   = var.platform
  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  # Enable basic authentication if required
  enable_basic_auth      = var.enable_basic_auth
  basic_auth_credentials = var.enable_basic_auth ? base64encode("${var.basic_auth_username}:${var.basic_auth_password}") : null

  # Variables that are passed to the build process.
  environment_variables = merge(
    var.environment_variables,
    {
      "_LIVE_UPDATES" = jsonencode(var.live_updates),
      "_CUSTOM_IMAGE" = var.custom_image,
    }
  )

  lifecycle {
    ignore_changes = [
      environment_variables,
    ]
  }
}

resource "aws_amplify_branch" "main" {
  app_id                = aws_amplify_app.main.id
  branch_name           = var.branch
  framework             = var.framework
  stage                 = "PRODUCTION"
  environment_variables = var.branch_environment_variables
}

resource "aws_amplify_domain_association" "main" {
  app_id      = aws_amplify_app.main.id
  domain_name = var.domain_name

  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = ""
  }

  lifecycle {
    ignore_changes = [
      certificate_settings
    ]
  }
}
