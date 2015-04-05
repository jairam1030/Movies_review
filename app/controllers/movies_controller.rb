class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  respond_to :html

  def search
    if params[:search].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end
  
  def index
    @movies = Movie.all
    respond_with(@movies)
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
    respond_with(@movie)
  end

  def new
    @movie = current_user.movies.build
    respond_with(@movie)
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)
    @movie.save
    respond_with(@movie)
  end

  def update
    @movie.update(movie_params)
    respond_with(@movie)
  end

  def destroy
    @movie.destroy
    respond_with(@movie)
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end
end
