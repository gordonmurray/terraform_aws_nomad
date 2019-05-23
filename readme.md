# Terraform Nomad

Create a Hashicorp Nomad AMI for use on AWS using Packer

## validate packer file

> packer validate -var-file=variables.vault.json vault.packer.json

## Build AMI

> packer build -var-file=variables.vault.json vault.packer.json
