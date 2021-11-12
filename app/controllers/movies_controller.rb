class MoviesController < ApplicationController
     before_action :set_movie, only: %i[show]
  def index
    @movies = Movie.all
  end

  def show; end


  def search
     @movies = Movie.where("name LIKE '%#{params[:query]}%'")
    #  correction quizz : @movies = Movie.where(title: params[:query])
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
