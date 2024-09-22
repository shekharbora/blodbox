require 'sneakers'
Sneakers.configure(
  heartbeat: 30,
  amqp: 'amqp://root:12345@localhost:5672',  # Corrected AMQP URL format
  vhost: '/',
  exchange_type: :direct,
  daemonize: false,
  workers: 1,
  log: 'log/sneakers.log',
  log_stdout: true,
  prefetch: 1
)

WORKER_OPTIONS = {
  ack: true,
  prefetch: 10
}
