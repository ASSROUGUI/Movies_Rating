class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
 
  end
  def index
    @movie = Movie.all 
  end

  def new
    @movie=current_user.movies.new
  end
  def show
    @review = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @review.average(:rating).round(2)
    end
  end

  def edit
  end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
        redirect_to @movie
    else
        render 'new'
    end 
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
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])    
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:movies_name, :description, :movie_length, :actors_name, :rating, :poster, :tyoler, :movie_id, :search, :user_id, :id)
    end
end
