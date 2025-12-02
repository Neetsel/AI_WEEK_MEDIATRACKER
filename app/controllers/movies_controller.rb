class MoviesController < ApplicationController
  befor_action :set_movie, only: [:show]

  def show
  end

  private

  def set_movies
    @movie = Movie.find(params[:id])
  end
end
