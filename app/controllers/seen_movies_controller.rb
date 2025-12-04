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
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: root_path) }
      end
    else
      # redirect_to movies_path alert: "Could not add movie."
    end
  end

  def destroy
    if @seenMovie.destroy!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  private

  def set_seen_movie
    @seenMovie = SeenMovie.find(params[:id])
  end

end
