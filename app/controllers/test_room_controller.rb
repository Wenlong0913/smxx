class TestRoomController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  def index
    @rooms = Chat::Room.all
  end

  def create
    @room = Chat::Room.find_or_create_by(name: params['new-room'])
  end

  def destroy
    @room = Chat::Room.find(params[:id])
    @room.destroy
  end
end
