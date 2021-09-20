#!/bin/bash

# Generate CA private key
openssl genrsa -out ca.pem 2048

# Generate CA root cert
openssl req -new -x509 -key ca.pem -out ca.crt -subj /CN=TestCA/O=MyTestCA/C=FR/L=Paris/ST=IdF/ -nodes -days 365

# Generate server private key
openssl genrsa -out etc/tls/rabbitmq-server-key.pem 2048

# Generate server csr
openssl req -new -key etc/tls/rabbitmq-server-key.pem -out etc/tls/rabbitmq-server-req.pem -outform PEM -subj /CN=rabbitmq.example.com/O=rabbitmq-demo/C=FR/L=Paris/ST=IdF/OU=rabbitmq-unit/ -nodes -days 365

# Sign server cert
openssl x509 -req -in etc/tls/rabbitmq-server-req.pem -CA ca.crt -CAkey ca.pem -CAcreateserial -out etc/tls/rabbitmq-server-cert.pem -days 365

# Generate client private key
openssl genrsa -out client/rabbitmq-client-key.pem 2048

# Generate client csr
openssl req -new -key client/rabbitmq-client-key.pem -out client/rabbitmq-client-req.pem -outform PEM -subj /CN=guest/O=RandomClient/C=FR/L=Paris/ST=IdF/OU=RandomUnit/ -nodes -days 365

# Sign client cert
openssl x509 -req -in client/rabbitmq-client-req.pem -CA ca.crt -CAkey ca.pem -CAcreateserial -out client/rabbitmq-client-cert.pem -days 365

cp ca.crt client/
cp ca.crt etc/tls/

#rm ca.crt ca.pem ca.srl client/rabbitmq-client-req.pem etc/tls/rabbitmq-server-req.pem
