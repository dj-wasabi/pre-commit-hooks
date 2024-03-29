# Pre-commit-hooks

**Table of contents**
<!--TOC-->

- [Pre-commit-hooks](#pre-commit-hooks)
  - [Hooks](#hooks)
  - [Scripts](#scripts)
- [Installation](#installation)
  - [Prerequisites Documentation](#prerequisites-documentation)
    - [terraform-docs](#terraform-docs)
    - [terraform-docs-adoc](#terraform-docs-adoc)
    - [markdown-toc](#markdown-toc)
  - [Supporting packages](#supporting-packages)
  - [Usage](#usage)
    - [no-commit-on-branch](#no-commit-on-branch)

<!--TOC-->

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/dj-wasabi/pre-commit-hooks)

## Hooks

This pre-commit-hooks repository contains the following hooks.

| Hook name     | Description |
|---------------|------------|
|terraform-docs| Inserts input and output documentation into `README.md` (using terraform-docs).|
|terraform-docs-adoc|Inserts input and output documentation into `README.adoc` (using terraform-docs).|
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
|markdown-toc|Generate a Table of Contents in a Markdown Document|
|no-commit-on-branch|Do no allow any commit on either specified branch.|

The hook name can be used with the `.pre-commit-config.yaml` as `id`. See [usage](#usage) for an example.

## Scripts

A bunch of scripts (founds on different places, provided link where they were found) that would help me to create better code.

The following scripts are in this repository in the `bin/` directory:
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
* markdown-toc.sh
* no-commit-on-branch.sh

# Installation

```sh
brew install pre-commit
```

## Prerequisites Documentation

The following needs to be set in order to get several hooks work related to documentation.

### terraform-docs

For updating Markdown documentation with information that is generated from Terraform, you will need to add the following 2 lines in the document.

```md
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
```

### terraform-docs-adoc

For updating Asciidoctor documentation with information that is generated from Terraform, you will need to add the following 2 lines in the document.

```md
// BEGIN TERRAFORM ASCIIDOC
// END TERRAFORM ASCIIDOC
```

Default, the `README.adoc` in the ROOT of the repository will be updated. You can also specify a different asciidoctor file:

```yaml
    - id: terraform-docs-adoc
      args: ["-s src", "-f documentation/index.adoc"]
```

Where `-f` is the location to the asciidoctor file. With `-s` you can override and specify a directory containing the Terraform code (Default `.` is used).

### markdown-toc

The following needs to be added in the Markdown document to generate a Table of content:

```md
<!--TOC-->
```

## Supporting packages

The following needs to be installed when you want to use all of the hooks.

```sh
brew tap liamg/tfsec
brew install gawk terraform-docs tflint tfsec coreutils helm hadolint shellcheck
```

```sh
pip install checkov ansible-lint yamlfmt md-toc
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

### no-commit-on-branch

The following is an example on how to not allow commits into the `main` or `master` branch:

```yaml
---
repos:
- repo: https://github.com/dj-wasabi/pre-commit-hooks
  rev: master
  hooks:
    - id: no-commit-on-branch
      args: ['-b master,main']
```
