class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_for session[:user_id]
  end
end
