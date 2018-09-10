# Provision Django app in AWS EC2

The goal of this guide is to allows users to easily provision a development env in AWS EC2 Instance.

## Reference Material

- [Terraform Getting Started](https://www.terraform.io/intro/getting-started/install.html)
- [Terraform Docs](https://www.terraform.io/docs/index.html)
- [Terrafrom Guides ](https://github.com/hashicorp/terraform-guides)


## Estimated Time to Complete

5 minutes.

## Challenge

There are many different ways to provision and configure an ec2 instance

## Solution

Provision a development enviropment in EC2

The AWS Development guide is for **educational purposes only**. It's designed to allow you to quickly standup a single instance EC2 with Django Apps. 

## Prerequisites

- [Download Terraform](https://www.terraform.io/downloads.html)
- Create folder for keypairs
- Generate key pairs 

### Command
 ssh-keygen

### Output
    files in %USERPROFILE%/.ssh


## Steps

We will now provision the development apps.

### Step 1: Initialize

Initialize Terraform - download providers and modules.

#### CLI

[`terraform init` Command](https://www.terraform.io/docs/commands/init.html)

##### Request

```
terraform init
```

##### Response
```
```

### Step 2: Plan

Run a `terraform plan` to ensure Terraform will provision what you expect.

#### CLI

[`terraform plan` Command](https://www.terraform.io/docs/commands/plan.html)

##### Request

```sh
$ terraform plan
```

##### Response
```
```

### Step 3: Apply

Run a `terraform apply` to provision the Django Apps. 

#### CLI

[`terraform apply` command](https://www.terraform.io/docs/commands/apply.html)

##### Request

```sh
$ terraform apply
```

##### Response
```
```

## Next Steps

Now that you've provisioned and configured the dev enviropment in EC2
