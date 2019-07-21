class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
    @movie=Movie.new(movie_params)
    if @movie.save
        redirect_to @movie
    else
        render 'new'
    end 
  end

  def search
  end

  def delete
  end
end

def index
end

def new
    @movie=Movie.new
end


private
def movie_params
params.require(:movie).permit(:title, :content)
end
