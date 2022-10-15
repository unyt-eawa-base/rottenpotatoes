class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find id
  end

  def new
    @movie = Movie.new
    # default: render 'new'
  end

  def create
    Movie.create! movie_params
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie)
          .permit(:title, :rating, :release_date)
  end
end
