class ChatsController < ApplicationController
  before_action :set_chat, only: [:show]

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @title = "#{@movie.title} - chat"
    @chat = Chat.new(user_id: @user.id, movie_id: @movie.id, title: @title)

    if @chat.save!
      redirect_to chat_path(@chat)
    end
  end

  def show
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
    @message = Message.new
  end
end
