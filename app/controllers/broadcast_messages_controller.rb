class BroadcastMessagesController < ApplicationController
  def update
    @message = BroadcastMessage.first
    @message.update(content: params[:content])

    ActionCable.server.broadcast(
      "broadcast_message",
      {content: @message.content}
    )
    head :ok
  end
end
