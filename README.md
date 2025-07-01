# AKS Key Vault Integration with Workload Identity

This project demonstrates how to securely mount Azure Key Vault secrets inside pods running on Azure Kubernetes Service (AKS) using Azure Workload Identity and the Secrets Store CSI driver.

## Features
- 🔐 **Workload Identity Authentication**: No secrets or credentials stored in pods.
- 🔄 **Dynamic Secret Mounting**: Secrets from Azure Key Vault are mounted as volumes and kept up to date.
- 🛡️ **RBAC Secured Access**: Secrets access is scoped using Azure role assignments.
- 🧪 **Sample Pod Deployment**: Includes a demo pod accessing a mounted secret via CSI.

## Architecture
This setup integrates the following components:
- AKS cluster with OIDC and Workload Identity enabled
- Azure Key Vault configured for RBAC access
- User Assigned Managed Identity (UAMI)
- Federated identity binding between AKS and Key Vault
- Secrets Store CSI driver for secret projection

## Requirements
- Azure CLI
- `kubectl`
- An Azure subscription with AKS and Key Vault permissions

## Setup Steps
All scripts and manifests are organized under the `manifests/` folder:

1. **Provision AKS Cluster**: `01-aks-cluster-create.sh`
2. **Create Azure Key Vault**: `02-keyvault-create.sh`
3. **Setup UAMI**: `03-uami-setup.sh`
4. **Add Federated Credential**: `04-federated-credential.sh`
5. **Define SecretProviderClass**: `05-secretproviderclass.yaml`
6. **Create Workload Identity ServiceAccount**: `06-workload-identity-sa.yaml`
7. **Deploy Demo Pod**: `07-busybox-pod.yaml`

> Replace placeholders like `<USER_ASSIGNED_CLIENT_ID>`, `<AKS_OIDC_ISSUER>`, and `<IDENTITY_TENANT>` with actual values before deployment.

## Demo Validation
After deployment:
```sh
kubectl exec busybox-secrets-store-inline-wi -- ls /mnt/secrets-store/
kubectl exec busybox-secrets-store-inline-wi -- cat /mnt/secrets-store/hrs
```

## License
MIT
