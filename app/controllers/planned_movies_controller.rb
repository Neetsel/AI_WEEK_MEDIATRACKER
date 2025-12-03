class PlannedMoviesController < ApplicationController
  before_action :set_planned_movie, only: [:destroy]
  def index
    @planned_movies = PlannedMovie.where(user_id: current_user.id)
  end

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @planned_movie = PlannedMovie.new(user_id: @user.id, movie_id: @movie.id)
    if @planned_movie.save!
      redirect_to planned_movies_path, notice: "Movie added to your watchlist!"
    else
      redirect_to movies_path, alert: "Could not add movie."
    end
  end

  def destroy
    @planned_movie.destroy
  end

  private

  def set_planned_movie
    @planned_movie = PlannedMovie.find(params[:id])
  end

end
