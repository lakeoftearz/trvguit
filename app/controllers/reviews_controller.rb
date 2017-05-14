class ReviewsController < ApplicationController
     before_action :logged_in_user, only: [:edit, :update, :destroy, :index]
  
  before_action :admin_user,     only:  [:edit, :update, :destroy, :index]
   around_action :collect_metrics
   
     def collect_metrics
    start = Time.now
    yield
    duration = Time.now - start
    Rails.logger.info "#{controller_name}##{action_name}: #{duration}s"
    
  end
  
    def index
    @reviews = Review.all.where(published: false)
  end
  
   def destroy
    @review=Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to reviews_path
  end
  def new    
   @fcomp = Fcomp.find(params[:fcomp_id])
   @review = @fcomp.reviews.new
    end
  
   def create
     @fcomp = Fcomp.find(params[:fcomp_id])
      @review = @fcomp.reviews.new(review_params)   
     
    if params[:custom_field] == "false"
   #  @fcomp = Fcomp.find(params[:id])
    #    @review = @fcomp.Reviews.new(review_params)   
    #if duration something something
    
         if @review.save           
      flash[:success] = "Review Created! It is now pending admin moderation before it gets published"
      redirect_to fcomp_path(@fcomp.id) 
    else
     render 'new' 
      
    end
   else
     flash[:success] = "Review Created! It is now pending admin moderation before it gets published"
      redirect_to fcomp_path(@fcomp.id) 
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
                                   :rtg1, :rtg2, :rtg3, :rtg4, :rtg5,
                                   :custom_field)
end


end