az aks create \
  --name keyvault-demo-cluster \
  -g keyvault-demo \
  --node-count 1 \
  --enable-addons azure-keyvault-secrets-provider \
  --enable-oidc-issuer \
  --enable-workload-identity
