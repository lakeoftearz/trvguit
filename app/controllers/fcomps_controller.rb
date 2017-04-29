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
    
     @ratings1 = @fcomp.reviews.to_a
     @avg_rating1 = if @ratings1.blank?
    0
  else
    @fcomp.reviews.average(:rtg1).round(2)
  end
     @ratings2 = @fcomp.reviews.to_a
     @avg_rating2 = if @ratings2.blank?
    0
  else
    @fcomp.reviews.average(:rtg2).round(2)
  end
       @ratings3 = @fcomp.reviews.to_a
     @avg_rating3 = if @ratings3.blank?
    0
  else
    @fcomp.reviews.average(:rtg3).round(2)
  end
       @ratings4 = @fcomp.reviews.to_a
     @avg_rating4 = if @ratings4.blank?
    0
  else
    @fcomp.reviews.average(:rtg4).round(2)
  end
       @ratings5 = @fcomp.reviews.to_a
     @avg_rating5 = if @ratings5.blank?
    0
  else
    @fcomp.reviews.average(:rtg5).round(2)
  end  
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
      params.require(:fcomp).permit(:name, :country, :webpage,:country_name,
                                   :logo, :rules)
    end
    
      

end
