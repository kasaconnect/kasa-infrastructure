account_id = "471112800881"
region     = "us-east-1"



aws_region    = "us-east-1"
ami           = "ami-04b4f1a9cf54c11d0"
instance_type = "t2.micro"


# ---------------------------------------------------------------------------------------------
# SSM Parameters
# ---------------------------------------------------------------------------------------------

ssm = {
#   SWAGGER_USER                          = "development"
#   ACCESSTOKEN                           = "{PLACEHOLDER}"
#   API_KEYS_RETURNS                      = "{PLACEHOLDER}"
#   API_SUPER_ADMIN_KEY                   = "{PLACEHOLDER}"
#   AUTH_HASH_SECRET_RETURNS              = "{PLACEHOLDER}"
#   AUTH_TOKEN_EXPIRATION_TIME            = "240"
#   CORS_ENABLE                           = "false"
#   CORS_KEY                              = "{PLACEHOLDER}"
}

vpc = {
  vpc_cidr = "10.1.0.0/16"
  # Subnets
  public_subnets      = ["10.1.0.0/20", "10.1.16.0/20"]
  private_subnets     = ["10.1.128.0/20", "10.1.144.0/20"]
  database_subnets    = ["10.10.21.0/24", "10.10.22.0/24"]
  elasticache_subnets = ["10.10.31.0/24", "10.10.32.0/24"]
}