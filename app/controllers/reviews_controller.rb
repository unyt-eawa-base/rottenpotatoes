class ReviewsController < ApplicationController
  before_action :set_current_user
  before_action :has_moviegoer_and_movie, only: [:new, :create]

  protected
  def has_moviegoer_and_movie
    unless @current_moviegoer
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end

  public
  def new
    if (Review.find_by_movie_id_and_moviegoer_id @movie.id, @current_moviegoer.id)
      flash[:notice] = 'You have already entered a review for this movie'
      redirect_to movie_path(@movie) and return
    end
    @review = @movie.reviews.build
  end

  def create
    @current_moviegoer.reviews << @movie.reviews.build(review_params)
    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review)
          .permit(:potatoes, :comments)
  end

end
