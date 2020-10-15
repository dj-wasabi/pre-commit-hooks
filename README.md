# Pre-commit-hooks

Table of contents

- [Pre-commit-hooks](#pre-commit-hooks)
- [Installation](#installation)
  * [Supporting packages](#supporting-packages)
  * [Usage](#usage)

A bunch of scripts (founds on different places, provided link where they were found) that would help me to create better code.

The following scripts are in this repository:
* ansible-lint (Package: `ansible-lint`);
* docker-lint;
* terraform-docs (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_docs.sh);
* terraform-fmt (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_fmt.sh);
* terraform-lint (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_tflint.sh);
* terraform-sec (https://github.com/antonbabenko/pre-commit-terraform/blob/master/terraform_tfsec.sh);
* terraform-validate (https://raw.githubusercontent.com/antonbabenko/pre-commit-terraform/master/terraform_validate.sh)
* helm-lint (https://github.com/gruntwork-io/pre-commit/blob/master/hooks/helmlint.sh)
* helm-unittest (HELM Plugin: https://github.com/quintush/helm-unittest)

# Installation

```sh
brew install pre-commit
```

## Supporting packages

The following needs to be installed when you want to use all of the hooks.

```sh
brew tap liamg/tfsec
brew install gawk terraform-docs tflint tfsec coreutils helm hadolint
```

```sh
pip install checkov ansible-lint
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
