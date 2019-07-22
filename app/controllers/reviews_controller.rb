class ReviewsController < ApplicationController
  
 
    def index
      @review = Review.all
    end
  
    def show
    end
  

    def new
      @review = Review.new
    end
  
    
    def edit
    end
  

    
    def create
      @review = Review.new(review_params)
  
      respond_to do |format|
        if @review.save
          format.html { redirect_to @review, notice: 'review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    
    def update
     
        
    end

    
    def destroy
      @review.destroy
      
    end
  
    private
      # def set_review
      #   @review = Review.find(params[:id])
      # end
  
      def review_params
        params.require(:review).permit(:review, :movie_id, :user_id)
      end
  end
  