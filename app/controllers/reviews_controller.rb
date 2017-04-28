class ReviewsController < ApplicationController
  def new    
   @fcomp = Fcomp.find(params[:fcomp_id])
   @review = @fcomp.reviews.new
    end
  
   def create
     @fcomp = Fcomp.find(params[:fcomp_id])
      @review = @fcomp.reviews.new(review_params)   
     
   #  @fcomp = Fcomp.find(params[:id])
    #    @review = @fcomp.Reviews.new(review_params)        
         if @review.save
      flash[:success] = "Review Created!"
      redirect_to fcomp_path(@fcomp.id) 
    else
     render 'new' 
      
    end
  end
  
    def show
    @fcomp = Fcomp.find(params[:fcomp_id])
    @reviews = @fcomp.reviews.find(params[:id])
  end


  def update
  @fcomp = Fcomp.find(params[:fcomp_id])
    @review = @fcomp.reviews.find(params[:id])
    @review.update_attributes(published: true)
     fcomp_review_path(review.fcomp, review.id)
end

def edit
      
    @fcomp = Fcomp.find(params[:fcomp_id])
    
    @review = @fcomp.reviews.find(params[:id])
  end
  
  
def review_params
   
      
 params.require(:review).permit(:fullname, :country, :email,
                                   :title, :content, :band, :country_name)
end
end