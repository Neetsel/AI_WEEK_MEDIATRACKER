class SeenMoviesController < ApplicationController
  before_action :set_seen_movie, only: [:destroy]
  def index
    @seenMovies = SeenMovie.where(user_id: current_user.id)
  end

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @seenMovie = SeenMovie.new(user_id: @user.id, movie_id: @movie.id)
    if @seenMovie.save!
      redirect_to seen_movies_path notice: "Movie added to your seenlist !"
    else
      redirect_to movies_path alert: "Could not add movie."
    end
  end

  def destroy
    @seenMovie.destroy
  end

  private

  def set_seen_movie
    @seenMovie = SeenMovie.find(params[:id])
  end

end
