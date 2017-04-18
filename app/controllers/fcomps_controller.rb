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
      redirect_to fcomps_path
    else
      render 'new'
    end
  end
  
  def fcomp_params
      params.require(:fcomp).permit(:name, :country, :webpage,
                                   :logo, :rules)
    end
end
