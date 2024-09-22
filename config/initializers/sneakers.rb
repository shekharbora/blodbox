require 'sneakers'
WORKER_OPTIONS = {

}
Sneakers.configure :heartbeat => 30,
                   :amqp => ENV['RABBIT_MQ_URL'],
                   :vhost => '/',
                   :exchange_type => :direct,
                   daemonize: false,
                   workers: 1,
                   log: "log/sneakers.log",
                   log_stdout: true,
                   prefetch: 1
WORKER_OPTIONS = {
  ack: true,
  prefetch: 10,
}

Sneakers.logger.level = Logger::INFO
