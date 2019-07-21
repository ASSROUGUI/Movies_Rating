class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movie = Movie.all 
  end

  def new
    @movie=Movie.new
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
  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
      
    redirect_to @movie
  end

  def destroy
        @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice=>"your movie has been deleted"
  end







 private
 def movie_params
 params.require(:movie).permit(:title, :content)
 end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:movies_name, :description, :movie_length, :actors_name, :rating)
    end
end
