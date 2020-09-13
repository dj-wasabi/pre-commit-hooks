# Pre-commit-hooks

A bunch of scripts (founds on different places, provided link where they were found) that would help me to create better code.




The following scripts are in this repository:
* ansible-lint (Package: `ansible-lint`)
* terraform-docs (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_docs.sh);
* terraform-fmt (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_fmt.sh);
* terraform-lint (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_tflint.sh);
* terraform-sec (https://github.com/antonbabenko/pre-commit-terraform/blob/master/terraform_tfsec.sh);
* terraform-validate (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_validate.sh)
* helm-lint (https://github.com/gruntwork-io/pre-commit/blob/master/hooks/helmlint.sh)


# Installation

```sh
brew install pre-commit
```

## Supporting packages

```sh
brew tap liamg/tfsec
brew install gawk terraform-docs tflint tfsec coreutils
```

```sh
pip install checkov ansible-lint
```

## Usage

```yaml
repos:
- repo: https://github.com/dj-wasabi/pre-commit-hooks
  rev: master
  hooks:
    - id: terraform-fmt
    - id: terraform-docs
    - id: terraform-sec
```
