class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]
  def index
    @likes = Like.where(user_id: current_user.id)
  end

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @like = Like.new(user_id: @user.id, movie_id: @movie.id)
    if @like.save
      redirect_to likes_path, notice: "Movie liked"
    else
      render "movies/show", status: :unprocessable_entity, notice: "You can't like a movie twice."
    end
  end

  def destroy
    @user = current_user
    if @like.destroy
      redirect_to likes_path, notice: "Movie removed from likes"
    else
      redirect_to likes_path, status: :unprocessable_entity
    end
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end
  def like_params
    params.require(:like).permit(:movie_id, :user_id)
  end
end
