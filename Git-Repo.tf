terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Login to github
provider "github" {
  token = "create-github-token-and-write-here"
}

# Create git repo
resource "github_repository" "repo1" {
  name = "repo1"
  visibility = "public"
}