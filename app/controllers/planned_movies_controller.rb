class PlannedMoviesController < ApplicationController
  def index
    @planned_movies = PlannedMovie.all
  end

end
