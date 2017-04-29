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
    @rating1 = @fcomp.reviews.to_a
  end


  def update
  @fcomp = Fcomp.find(params[:fcomp_id])
    @review = @fcomp.reviews.find(params[:id])
     
   if  @review.update_attributes(review_params)  
     
     flash[:success] = "Review Updated"
     redirect_to fcomp_review_path(@fcomp.id, @review.id)
   else
     render 'edit'
   end
   
end

def edit      
    @fcomp = Fcomp.find(params[:fcomp_id])    
    @review = @fcomp.reviews.find(params[:id])
  end
  
  
def review_params
   
      
 params.require(:review).permit(:fullname, :country, :email,
                                   :title, :content, :band, :country_name,
                                   :rtg1, :rtg2, :rtg3, :rtg4, :rtg5)
end
end