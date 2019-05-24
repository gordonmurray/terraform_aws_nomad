workflow "Terraform" {
  resolves = "terraform-plan"
  on = "push"
}

action "terraform-fmt" {
  uses = "hashicorp/terraform-github-actions/fmt@v0.2.0"
  needs = "filter-to-pr-open-synced"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = ".terraform"
  }
}

action "terraform-init" {
  uses = "hashicorp/terraform-github-actions/init@v0.2.0"
  needs = "terraform-fmt"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = ".terraform"
  }
}
