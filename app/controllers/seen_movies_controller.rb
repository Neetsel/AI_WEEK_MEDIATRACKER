class SeenMoviesController < ApplicationController
  before_action :set_seen_movie, only: [:destroy]
  def index
    @seenMovies = SeenMovies.all
  end

  def create
    @seenMovie = SeenMovie.new(seen_movie_params)
    @seenMovie.save
  end

  def destroy
    @seenMovie.destroy
  end

  private

  def set_seen_movie
    @seenMovie = SeenMovie.find(params[:id])
  end

  def seen_movie_params
    params.require(:seenMovie).permit(:movie_id, :user_id)
  end
end
