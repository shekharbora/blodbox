class FeedChannel < ApplicationCable::Channel
  # identified_by :current_user
  def subscribed
    stream_from "feed_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
