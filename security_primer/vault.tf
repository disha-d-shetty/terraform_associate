provider "vault" {
  address = "https://127.0.0.1:8200"
  token  = "root"
  skip_tls_verify = true
}
data "vault_generic_secret" "example" {
  path = "secret/aws/db-01"
}
output "password" {
  value = data.vault_generic_secret.example.data_json
  sensitive = true
}