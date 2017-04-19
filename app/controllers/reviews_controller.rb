class ReviewsController < ApplicationController
def new
    @review = Review.new
  end
  
   def create
    @review = Review.new(review_params) 
    if @review.save
      flash[:success] = "Review Created!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
def review_params
      
 params.require(:review).permit(:fullname, :country, :email,
                                   :title, :content, :band)
end

end