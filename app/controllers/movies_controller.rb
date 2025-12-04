class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all
  end


  def show
  end

  def create_from_omdb
    omdb = OmdbService.new
    response = omdb.search_by_id(params[:imdb_id])

    if response["Response"] == "True"
      movie = Movie.create(
        title: response["Title"],
        release_date: response["Year"],
        genres: response["Genre"],
        directors: response["Director"],
        description: response["Plot"],
        poster: response["Poster"]
      )
      respond_to do |format|
        format.html { redirect_to movie, notice: "Movie added" }
        format.turbo_stream
      end
    else
      redirect_to movies_path, alert: "Film not available."
    end

  end

  def search_from_omdb
    omdb = OmdbService.new
    response = omdb.search_multiple(params[:title])

    @results = response["Response"] == "True" ? response["Search"] : []

    render inline: <<~ERB
      <turbo-frame id="omdb_results">
        <%= render partial: "movies/omdb_results", locals: { results: @results } %>
      </turbo-frame>
    ERB

  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
