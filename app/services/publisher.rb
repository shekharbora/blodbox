class Publisher
  DEFAULT_OPTIONS = { durable: true, auto_delete: false }.freeze

  def self.publish(queue_name, payload)
    channel = ConnectionManager.instance.channel
    queue = channel.queue(queue_name, DEFAULT_OPTIONS)
    queue.publish(payload)
  end
end

# Publisher.publish(queue_name, payload)