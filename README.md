# Project 1 - Two-tier VPC (Terraform + Cloud Build)

This lab deploys:
- A custom VPC (`vpc-lab`)
- Two subnets (`public-subnet`, `private-subnet`)
- Two firewall rules (SSH locked to your IP for the public VM; tag-to-tag SSH from public -> private)
- Two VMs:
  - `vm-public` (external IP enabled)
  - `vm-private` (no external IP)

Deployed by Cloud Build using Terraform.

# gcp-networking
