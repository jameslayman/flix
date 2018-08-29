class MoviesController < ApplicationController

  def index
    @movies = Movie.released
  end

  def show
    @movies = Movie.find(params[:id])
  end

  def edit
    @movies = Movie.find(params[:id])
  end

  def update
    @movies = Movie.find(params[:id])
    @movies.update(movie_params)
    redirect_to @movies
  end

  def new
    @movies = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  private
    def movie_params
        params.require(:movie).permit(:title, :description, :rating, :released_on, :rank, :total_gross)
    end
end
