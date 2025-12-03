class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]
  def index
    @likes = Like.all
  end

  def create
    @like = Like.new(like_params)
    @like.save
  end

  def destroy
    @like.destroy
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end
  def like_params
    params.require(:like).permit(:movie_id, :user_id)
  end
end
