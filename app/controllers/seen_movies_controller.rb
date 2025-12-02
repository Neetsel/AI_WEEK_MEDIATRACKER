class SeenMoviesController < ApplicationController

  def create
    @seenMovie = SeenMovie.new(seenMovie_params)
    @seenMovie.save
  end

  def destroy
    @seenMovie = SeenMovie.new(seenMovie_params)
    @seenMovie.save
  end

  private

  def set_

  def seenMovie_params
    params.require(:seenMovie).permit(:movie_id, :user_id)
  end
end
