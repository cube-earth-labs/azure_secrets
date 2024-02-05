. .\env.ps1

vault write sys/sync/destinations/azure-kv/my-azure-1 `
    key_vault_uri="$KEY_VAULT_URI" `
    client_id="$CLIENT_ID" `
    client_secret="$CLIENT_SECRET" `
    tenant_id="$TENANT_ID"
