# Pre-commit-hooks

Table of contents

- [Pre-commit-hooks](#pre-commit-hooks)
  * [Hooks](#hooks)
  * [Scripts](#scripts)
- [Installation](#installation)
  * [Supporting packages](#supporting-packages)
  * [Usage](#usage)


## Hooks

This pre-commit-hooks repository contains the following hooks.

| Hook name     | Description |
|---------------|------------|
|terraform-docs| Inserts input and output documentation into README.md (using terraform-docs).|
|terraform-validate|Validates all Terraform configuration files.|
|terraform-sec|Static analysis of Terraform templates to spot potential security issues.|
|terraform-lint|Validates all Terraform configuration files with TFLint.|
|terraform-fmt|Rewrites all Terraform configuration files to a canonical format.|
|checkov|Runs checkov on Terraform templates.|
|helm-lint|Run helm lint, a linter for helm charts|
|helm-unittest|This hook run helm unittest from quintush/helm-unittest|
|docker-lint|Runs hadolint to lint Dockerfiles|
|shellcheck|Performs linting on bash scripts|
|verify-json|Checks JSON files and pretty prints them|
|verify-yaml|Checks YAML files and pretty prints them|

The hook name can be used with the `.pre-commit-config.yaml` as `id`. See [usage](#usage) for an example.

## Scripts

A bunch of scripts (founds on different places, provided link where they were found) that would help me to create better code.

The following scripts are in this repository:
* docker-lint;
* terraform-docs (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_docs.sh);
* terraform-fmt (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_fmt.sh);
* terraform-lint (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_tflint.sh);
* terraform-sec (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_tfsec.sh);
* terraform-validate (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_validate.sh);
* helm-lint (https://raw.githubusercontent.com/gruntwork-io/pre-commit/master/hooks/helmlint.sh);
* helm-unittest (HELM Plugin: https://github.com/quintush/helm-unittest);
* shellcheck (https://raw.githubusercontent.com/gruntwork-io/pre-commit/master/hooks/shellcheck.sh);
* verify-json.sh
* verify-yaml.sh

# Installation

```sh
brew install pre-commit
```

## Supporting packages

The following needs to be installed when you want to use all of the hooks.

```sh
brew tap liamg/tfsec
brew install gawk terraform-docs tflint tfsec coreutils helm hadolint shellcheck
```

```sh
pip install checkov ansible-lint yamlfmt
```

Install the HELM Unittests
```sh
helm plugin install https://github.com/quintush/helm-unittest
```

## Usage

Create a file named `.pre-commit-config.yaml` in the repository.

Add something like the following:

```yaml
---
repos:
- repo: https://github.com/dj-wasabi/pre-commit-hooks
  rev: master
  hooks:
    - id: terraform-fmt
    - id: terraform-docs
    - id: terraform-sec
```

When the file is added, run the following command to install it:

```s
pre-commit install
```

Now, when you do a `git commit` the hooks are executed. You can manually run the hooks by executing the following command:

```sh
pre-commit run -a
```
