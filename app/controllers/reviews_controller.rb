class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
 
  before_action :authenticate_user!

  def index
    @review = Review.all
  end
  def new
    @review = Review.new
    @movie = params[:movie_id]
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to movie_path(@review.movie_id)
    else
      render 'new'
    end
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @review = Movie.find(params[:review_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment, :movie_id ,:user_id)
    end
end
