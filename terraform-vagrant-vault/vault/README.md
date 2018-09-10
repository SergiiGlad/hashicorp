Download and unzip Vault
https://releases.hashicorp.com/vault/0.10.4/vault_0.10.4_windows_amd64.zip

Execute the following command to verify the vault version:
vault version

You may need to set the following environment variable:
set VAULT_ADDR=http://127.0.0.1:8200

Execute the following command to start the Vault server:
vault server -config=config.hcl

Vault operator init command to initialize Vault:
vault operator init

Execute the vault operator unseal command:
vault operator unseal 

Set environment variables VAULT_TOKEN

Log into Vault using the initial root token:
vault login 

Create a secret with pair key and value 
vault kv put secret/foo login=name password=pwd

You can also interact with Vault via the HTTP API

Create a new secret:

curl -H "X-Vault-Token: %VAULT_TOKEN% -X PUT --data '{"Name": "sample", "Type": "management"}' http://127.0.0.1:8200/v1/secret/foo

Read the secret:

curl -H "X-Vault-Token: %VAULT_TOKEN%" -X GET http://127.0.0.1:8200/v1/secret/foo
