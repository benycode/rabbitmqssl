# rabbitmq-server-ssl

RabbitMQ server running in a docker container with ssl enabled

## Usage

```bash
# Edit 'generate_tls_certificate.sh' to setup your DNS on the rabbitmq server
❯ ./generate_tls_certificate.sh
❯ dock-compose up --build --detach
```

## UI management

- <http://127.0.0.1:15672>

**credentials:** `guest/guest`
