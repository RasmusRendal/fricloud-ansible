openssl req -new > new.ssl.csr && \
openssl rsa -in privkey.pem -out new.cert.key && \
openssl x509 -in new.ssl.csr -out new.cert.cert -req -signkey new.cert.key -days 100
