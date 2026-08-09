# Random password generator
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+"
}

# Secrets Manager Secret Container
resource "aws_secretsmanager_secret" "db_secret" {
  name                    = "${var.environment}-db-credentials-v1"
  recovery_window_in_days = 0 # Immediate deletion if destroyed during testing
}

# Storing DB credentials inside the Secret
resource "aws_secretsmanager_secret_version" "db_secret_val" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
    engine   = "postgres"
    port     = 5432
    dbname   = var.db_name
  })
}