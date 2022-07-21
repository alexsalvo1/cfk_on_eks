# Create Certificate Authority
cfssl gencert -initca resources/sslcerts/ca/ca-csr.json | cfssljson -bare ca -
mv ca.pem resources/sslcerts/ca/ca.pem
mv ca-key.pem resources/sslcerts/ca/ca-key.pem
mv ca.csr resources/sslcerts/ca/ca.csr

# Validate Certificate Authority
openssl x509 -in resources/sslcerts/ca/ca.pem -text -noout

# Create server certificates with the appropriate SANs (SANs listed in server-domain.json)
cfssl gencert -ca=resources/sslcerts/ca/ca.pem \
-ca-key=resources/sslcerts/ca/ca-key.pem \
-config=resources/sslcerts/ca/ca-config.json \
-profile=server resources/sslcerts/server/server-domain.json | cfssljson -bare server
mv server.pem resources/sslcerts/server/server.pem
mv server-key.pem resources/sslcerts/server/server-key.pem
mv server.csr resources/sslcerts/server/server.csr

# Validate server certificate and SANs
openssl x509 -in resources/sslcerts/server/server.pem -text -noout