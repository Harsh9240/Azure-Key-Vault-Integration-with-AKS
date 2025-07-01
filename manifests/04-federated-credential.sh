az identity federated-credential create \
  --name federated-identity \
  --identity-name azurekeyvaultsecretsprovider-keyvault-demo-cluster \
  --resource-group keyvault-demo \
  --issuer <AKS_OIDC_ISSUER> \
  --subject system:serviceaccount:default:workload-identity-sa \
  --audiences api://AzureADTokenExchange
