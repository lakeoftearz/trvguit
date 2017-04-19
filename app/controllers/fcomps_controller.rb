class FcompsController < ApplicationController
  
  def index
    @fcomps = Fcomp.all
  end


  def new
    @fcomp = Fcomp.new
  end
  
   def create
    @fcomp = Fcomp.new(fcomp_params) 
    if @fcomp.save
      flash[:success] = "Company Created!"
      redirect_to @fcomp
      
    else
      render 'new'
    end
  end
  
  def newreview
    @review = Review.new
  end
  
   def createreview
    @review = Review.new(review_params) 
    if @freview.save
      flash[:success] = "Review Created!"
      redirect_to @fcomp
      
    else
      render 'newreview'
    end
  end
  
  def show
    @fcomp = Fcomp.find(params[:id])
    @reviews = @fcomp.reviews.paginate(page: params[:page])
  end

 def edit
    @fcomp = Fcomp.find(params[:id])
  end

  def update
    @fcomp = Fcomp.find(params[:id])
    if @fcomp.update_attributes(fcomp_params)
      flash[:success] = "Company updated"
      redirect_to @fcomp

    else
      render 'edit'
    end
  end
  
  def fcomp_params
      params.require(:fcomp).permit(:name, :country, :webpage,
                                   :logo, :rules)
    end
    
      
def review_params
      
 params.require(:review).permit(:fullname, :country, :email,
                                   :title, :content, :band)
end
end
