# In-Memory Storage Backend
storage "inmem" { }

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}


# Activating the Vault UI
ui = true
