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
  
  def publishreview
    @fcomp = Fcomp.find(params[:id])
    @review = @fcomp.reviews.find(params[:format])
    @review.update(published: true)
    redirect_to fcomp_review_path(@review.fcomp_id, @review.id)
   
end

  def unpublishreview
    @fcomp = Fcomp.find(params[:id])
    @review = @fcomp.reviews.find(params[:format])
    @review.update(published: false)
    redirect_to fcomp_review_path(@review.fcomp_id, @review.id)
   
end

  def fcomp_params
      params.require(:fcomp).permit(:name, :country, :webpage,
                                   :logo, :rules)
    end
    
      

end
