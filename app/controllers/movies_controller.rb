class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all
  end


  def show
  end

  def create_from_omdb
    omdb = OmdbService.new
    response = omdb.search_by_title(params[:imbd_id])
    if response["Response"] == "True"
      movie = Movie.create(
        title: response["Title"],
        release_date: response["Year"],
        genres: response["Genre"],
        directors: response["Director"],
        description: response["Plot"],
        poster: response["Poster"]
      )
      redirect_to movie, notice: "Movie added"
    else
      redirect_to movies_path, alert: "Film not available."
    end
  end

  def search_from_omdb
    omdb = OmdbService.new
    response = omdb.search_multiple(params[:title])
    if response["Response"] == "True"
      @results = response["Search"]
    else
      @results = []
      flash[:alert] = "no films found."
    end
  end
  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
