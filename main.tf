terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.80.0"
        }
    }
}

data aws_caller_identity main {}

data aws_iam_policy_document main {
    statement {
        actions = [
            "sts:AssumeRoleWithWebIdentity"
        ]
        principals {
            type = "Federated"
            identifiers = ["arn:aws:iam::${data.aws_caller_identity.main.account_id}:oidc-provider/token.actions.githubusercontent.com"]
        }
    }
}

resource aws_iam_role main {
    name = var.role_name != "wklfujvmfz" ? null : var.role_name
    name_prefix = var.role_name == "wklfujvmfz" ? "gha-" : null
    assume_role_policy = data.aws_iam_policy_document.main.json
}