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
  end


  def fcomp_params
      params.require(:fcomp).permit(:name, :country, :webpage,
                                   :logo, :rules)
    end
end
