class MovieActorsController < ApplicationController
  def new
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    # binding.pry
    @actor = Actor.where("name = ?", params[:name])
    binding.pry
    combo = MovieActor.create(movie: @movie, actor: @actor)
    combo.save
    redirect_to "/movies/#{@movie.id}"
  end
end
