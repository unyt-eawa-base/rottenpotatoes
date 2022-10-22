class MoviesController < ApplicationController
  before_action :enforce_login, except: [:index, :show]
  before_action :set_current_user
  def index
    @movies = Movie.all
    respond_to do |format|
      format.html {render 'index'}
      format.xml {render :xml => @movies}
      format.json {render :json => @movies}
    end
  end

  def show
    id = params[:id]
    @movie = Movie.find id
    @review = @movie.reviews.where(moviegoer_id: @current_moviegoer.id).first if logged_in?
=begin
    respond_to do |format|
      format.html {render 'show'}
      format.xml {render :xml => @movie}
      format.json {render :json => @movie}
    end
=end
    render(:partial => 'movie', :object => @movie) if request.xhr?

  end

  def new
    @movie = Movie.new
    # default: render 'new'
  end

  def create
    @movie = Movie.new movie_params
    if (@movie.save)
      flash[:notice] = "Movie #{@movie.title} was successfully created!"
      redirect_to movies_path
    else
      render :new, status: 422
    end
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    if (@movie.update movie_params)
      flash[:notice] = "Movie #{@movie.title} successfully updated!"
      redirect_to movie_path(@movie)
    else
      render :edit, status:  422
    end
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Movie #{@movie.title} successfully deleted!"
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie)
          .permit(:title, :rating, :release_date)
  end
end
