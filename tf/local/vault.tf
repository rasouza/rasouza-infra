resource "vault_github_auth_backend" "github" {
  organization = "programming-diary"
}

resource "vault_github_user" "rasouza" {
    backend = vault_github_auth_backend.github.id
    user = "rasouza"
    policies = ["admins"]
}

### Policies

resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("vault/admin-policy.hcl")
}