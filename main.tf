data "aws_codestarconnections_connection" "tf-github" {
  name = "TF-Github"
}

data "aws_secretsmanager_secret" "thirdparty-creds" {
  name = "thirdparty_access_tokens"
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.thirdparty-creds.id
}
