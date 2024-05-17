terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
    }
  }
}

provider "onepassword" {}

data "onepassword_vault" "test-vault" {
  name = "<your-vault-name>"
}

resource "onepassword_item" "demo_login" {
  vault = data.onepassword_vault.test-vault.uuid

  title = "Test TF Resource - Login"
  category = "login"

  username = "MyUserName123"
  password_recipe {
    length = 30
    letters=false
  }

  url = "http://google.com"
}
