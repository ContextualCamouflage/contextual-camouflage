class MapChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'map_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
