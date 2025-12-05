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
      # Si movie existe déjà, on le récupère(cf.doc active record)
      @movie = Movie.find_or_initialize_by(title: response["Title"])
      # On met à jour les infos si besoin
      @movie.assign_attributes(
        title: response["Title"],
        release_date: response["Year"],
        genres: response["Genre"],
        directors: response["Director"],
        description: response["Plot"],
        poster: response["Poster"]
      )
      # On save seulement si c'est un nouveau record
      @movie.save if @movie.new_record? || @movie.changed?

      respond_to do |format|
        format.html { redirect_to @movie, notice: "Movie added or already present" }
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
    @movies = Movie.all

    respond_to do |format|
      format.turbo_stream
      format.html { render :index }
    end

  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
