class PlannedMoviesController < ApplicationController
  berfore_action :set_planned_movie, only: [:destroy]
  def index
    @planned_movies = PlannedMovies.all
  end

  def create
    @planned_movie = PlannedMovie.new(planned_movie_params)
    @planned_movie.save
  end

  def destroy
    @planned_movie.destroy
  end

  private

  def planned_movie_params
    params.require(:planned_movie).permit(:movie_id, :user_id)
  end

  def set_planned_movie
    @planned_movie = PlannedMovie.find(params[:id])
  end

end
