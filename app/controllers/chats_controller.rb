class ChatsController < ApplicationController
  before_action :redirect_if_already_exist, only: [:create]

  def create
    @user = current_user.id
    @movie = Movie.find(params[:movie_id])
    @title = "#{@movie.title} - chat"
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to chat_path(@chat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_already_exist
    redirect_to chat_path(@chat) if @chat
  end

  def chat_params
    params.require(:chat).permit(:title, :user_id, :movie_id)
  end
end
