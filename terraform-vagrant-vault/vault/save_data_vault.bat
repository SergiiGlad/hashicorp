%echo off

echo "Pick up data for save in Vault secret/foo"

set /p LOGIN=Enter login name:

set /p PASSWORD=Enter login password:

set /p PATH=Enter path/file for private_key of vagrant machine:

set /p KEY= <%PATH%

vault kv put secret/foo login=%LOGIN% password=%PASSWORD% key=@%KEY%

@pause

cls
