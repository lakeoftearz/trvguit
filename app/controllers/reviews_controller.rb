class ReviewsController < ApplicationController
def new
    @review = Review.new
  end
  
   def create
    @review = Review.new(review_params) 
    if @review.save
      flash[:success] = "Company Created!"
      redirect_to @fcomp
    else
      render 'new'
    end
  end
  
def review_params
      
 params.require(:fcomp).permit(:fullname, :country, :email,
                                   :title, :content, :band)
end

end