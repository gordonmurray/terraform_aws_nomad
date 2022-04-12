# Terraform Nomad

Create a Nomad instance on AWS

## validate packer file

> packer validate -var-file=variables.vault.json vault.packer.json

## Build AMI using Packer

> packer build -var-file=variables.vault.json vault.packer.json

Once the EC2 instance is ready, the output will show the public IP address. To SSH in to the instance, use:

> ssh ubuntu@{ instance IP }.compute.amazonaws.com

## Cost estimate

```
Project: gordonmurray/terraform_aws_nomad/terraform

 Name                                                 Monthly Qty  Unit   Monthly Cost

 aws_instance.nomad[0]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)          730  hours        $66.58
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                      50  GB            $5.50

 OVERALL TOTAL                                                                  $72.08
──────────────────────────────────
6 cloud resources were detected:
∙ 1 was estimated, it includes usage-based costs, see https://infracost.io/usage-file
∙ 5 were free:
  ∙ 3 x aws_security_group_rule
  ∙ 1 x aws_key_pair
  ∙ 1 x aws_security_group
```