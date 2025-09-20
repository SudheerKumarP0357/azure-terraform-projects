---
title: Terraform with Azure -- 4-Month Project-Based Roadmap
---

This roadmap is designed to take a learner from beginner to senior-level
expertise in Terraform with Azure as the cloud provider. It spans 4
months, organized by monthly themes. Each project progressively builds
on the previous one, incorporates industry **Best Practices**, CI/CD
integration, and requires exploring Azure resources via Portal and CLI
before codifying with Terraform.

# Month 1 -- Foundations (Networking & Compute)

## Provision Resource Group & Storage Account

**Requirement**: Set up Resource Group + Storage Account as a remote state
backend.

**Azure Resources to Learn**: Resource Groups, Storage Accounts, Access Keys

**CI/CD**: Basic GitHub Actions pipeline: terraform fmt, validate,
init, plan.

**Best Practices**: Remote state storage, tagging conventions, secure
backend secrets in Key Vault.

## Build Virtual Network with Subnets & NSG

**Requirement**: Create VNet + Subnets + secure traffic with NSG.

**Azure Resources to Learn**: VNets, Subnets, NSGs

**CI/CD**: Add linting + terraform plan to pipeline.

**Best Practices**: Introduce modules, variables, and environment-specific
tfvars.

## Deploy VM with Networking

**Requirement**: Launch a Linux VM inside subnet + NSG with Public IP.

**Azure Resources to Learn**: Virtual Machines, NICs, Public IPs

**CI/CD**: Pipeline deploys dev workspace automatically.

**Best Practices**: Use locals for naming, RBAC for VM access, secure SSH
keys in Key Vault.

## Multi-Environment Setup

**Requirement**: Use Terraform workspaces to manage Dev/QA/Prod for VM +
VNet infra.

**Azure Resources to Learn**: Previously used resources

**CI/CD**: Add environment-based pipelines with workspace selection.

**Best Practices**: Tagging by environment, cost alerts, workspace
segregation.

# Month 2 -- PaaS Services (App Hosting & Databases)

## Deploy App Service with Azure SQL

**Requirement**: Host a web app on App Service with Azure SQL backend.

**Azure Resources to Learn**: App Services, App Service Plans, Azure SQL
Database

**CI/CD**: Add pipeline secret integration with Key Vault.

**Best Practices**: Store DB credentials in Key Vault, secure networking,
outputs for connection strings.

## Scalable App Behind Load Balancer

**Requirement**: Deploy VM Scale Set behind Azure Load Balancer.

**Azure Resources to Learn**: Load Balancer, VM Scale Sets

**CI/CD**: Introduce manual approval before prod deployment.

**Best Practices**: Reusable compute module, auto-shutdown dev/test, health
probes in LB.

# Month 3 -- Containers & Event-Driven Workloads

## Deploy AKS Cluster with ACR

**Requirement**: Deploy AKS cluster + push image to ACR.

**Azure Resources to Learn**: AKS, ACR

**CI/CD**: Pipeline pushes container image + deploys infra.

**Best Practices**: RBAC-enabled AKS, network policies, kubeconfig stored in
Key Vault.

## Secure AKS with Ingress + Application Gateway

**Requirement**: Ingress via Application Gateway for AKS workloads.

**Azure Resources to Learn**: Application Gateway, Managed Identities

**CI/CD**: Deploy helm charts via pipeline after infra.

**Best Practices**: HTTPS via Key Vault certs, autoscaling policies,
NSG-secured workloads.

## Event Hub + Azure Functions

**Requirement**: Event Hub triggers Functions for event processing.

**Azure Resources to Learn**: Event Hub, Functions, Storage Accounts

**CI/CD**: Add function deployment step after infra apply.

**Best Practices**: Zip deployment, Key Vault secrets, Log Analytics
integration.

# Month 4 -- Enterprise Infra (Governance & Monitoring)

## API Management + Logic Apps

**Requirement**: Secure APIs with API Management, integrate with Logic Apps.

**Azure Resources to Learn**: API Management, Logic Apps

**CI/CD**: Deploy APIs and workflows via pipeline stages.

**Best Practices**: RBAC policies, monitoring via Azure Monitor + Log
Analytics, policy enforcement.

## Enterprise Monitoring & Governance

**Requirement**: Centralized monitoring + enforce policies across infra.

**Azure Resources to Learn**: Azure Monitor, Log Analytics, Alerts, Azure
Policy

**CI/CD**: Add policy checks pre-deployment.

**Best Practices**: Policy as code, diagnostics settings, budgets and cost
alerts.

## Multi-Region, Multi-Subscription Landing Zone

**Requirement**: Deploy landing zone with networking, security, governance.

**Azure Resources to Learn**: Management Groups, Role Assignments, VNets,
ExpressRoute/VPN Gateway

**CI/CD**: Full pipeline with lint, plan, approval, apply for each
subscription.

**Best Practices**: Full modular repo, DR strategy, Terragrunt/monorepo,
security baselines.
