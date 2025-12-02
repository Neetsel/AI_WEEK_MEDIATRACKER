class PlannedMoviesController < ApplicationController
  def index
    @planned_movies = PlannedMovies.all
  end

end
