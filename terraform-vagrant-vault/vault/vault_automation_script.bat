%echo off

set VAULT_ADDR=http://127.0.0.1:8200

vault operator init > keys.txt

for /f "tokens=2 delims=:" %%i in ('findstr /r /c:"^Unseal Key 1:" keys.txt') do set KEY1=%%i
vault operator unseal %KEY1%

for /f "tokens=2 delims=:" %%j in ('findstr /r /c:"^Unseal Key 2:" keys.txt') do set KEY2=%%j
vault operator unseal %KEY2%

for /f "tokens=2 delims=:" %%k in ('findstr /r /c:"^Unseal Key 3:" keys.txt') do set KEY3=%%k
vault operator unseal %KEY3%

for /f "tokens=2 delims=:" %%l in ('findstr /r /c:"^Initial Root Token:" keys.txt') do set VAULT_TOKEN=%%l
vault login %VAULT_TOKEN%

echo "Pick up data for save in Vault secret/foo"

set /p LOGIN=Enter login name:

set /p PASSWORD=Enter login password:

set /p PATH=Enter path/file for private_key of vagrant machine:

set /p KEY= <%PATH%

vault kv put secret/foo login=%LOGIN% password=%PASSWORD% key=@%KEY%

@pause

cls
