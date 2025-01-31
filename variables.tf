variable "role_name" {
    type = string
    default = "wklfujvmfz"
}

variable "github_organization" {
    type = string

    validation {
        condition = !strcontains(var.github_organization, "*")
        error_message = "The GitHub organization cannot be a wildcard. Please specify a GitHub Organization"
    }
}

variable "github_repository" {
    type = string
    default = "*"
}

variable "github_environments" {
    type = list(string)
    default = []
}

variable "github_branches" {
    type = list(string)
    default = []
}

variable "github_tags" {
    type = list(string)
    default = []
}