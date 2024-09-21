ui = true
disable_mlock = "true"

storage "raft" {
  path    = "/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address = "[::]:8200"
  cluster_address = "[::]:8201"
  tls_disable = "false"
  tls_cert_file = "/certs/server.crt"
  tls_key_file  = "/certs/server.key"
  tls_client_ca_file = "/certs/ca.crt"
}

api_addr = "https://vault.community2024.local:8200"
cluster_addr = "https://vault.community2024.local:8200"
