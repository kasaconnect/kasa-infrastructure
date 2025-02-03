# -----------------------------------------------------------------------------------------------------------
# AWS App Runner
# -----------------------------------------------------------------------------------------------------------

# VPC Connector
resource "aws_apprunner_vpc_connector" "main" {
  vpc_connector_name = "${var.name}-vpc-connector"
  subnets            = var.vpc_connector_subnets
  security_groups    = var.vpc_connector_sgs
}

# AutoScaling Configuration
resource "aws_apprunner_auto_scaling_configuration_version" "main" {
  auto_scaling_configuration_name = var.auto_scaling_configuration_name
  min_size                        = var.min_size
  max_size                        = var.max_size

   lifecycle {
    prevent_destroy = true
  }
}

# App Runner Service
resource "aws_apprunner_service" "main" {
  service_name = "${var.name}"

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.main.arn

  source_configuration {
    authentication_configuration {
      connection_arn = var.connection_arn
    }

    auto_deployments_enabled = var.auto_deployments_enabled

    code_repository {
      code_configuration {
        code_configuration_values {
          build_command                 = var.code_configuration.build_command
          port                          = var.code_configuration.port
          runtime                       = var.code_configuration.runtime
          start_command                 = var.code_configuration.start_command
          runtime_environment_variables = var.environment_variables
          runtime_environment_secrets   = var.environment_secrets
        }

        configuration_source = var.configuration_source
      }

      repository_url = var.repository_url

      source_code_version {
        type  = var.type
        value = var.value
      }
    }
  }

  instance_configuration {
    cpu               = var.cpu
    memory            = var.memory
    instance_role_arn = var.instance_role_arn
  }

  health_check_configuration {
    healthy_threshold   = 1
    unhealthy_threshold = 5
    interval            = 10
    path                = "-"
    protocol            = "TCP"
    timeout             = 5
  }

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.main.arn
    }

    ingress_configuration {
      is_publicly_accessible = var.is_publicly_accessible
    }
  }

  dynamic "observability_configuration" {
    for_each = var.observability_enabled ? [1] : []

    content {
      observability_configuration_arn = aws_apprunner_observability_configuration.main[0].arn
      observability_enabled           = true
    }
  }
}

resource "aws_apprunner_observability_configuration" "main" {
  count = var.observability_enabled ? 1 : 0

  observability_configuration_name = "${var.name}-tracing"

  trace_configuration {
    vendor = "AWSXRAY"
  }
}
