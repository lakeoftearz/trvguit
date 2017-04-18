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

 def edit
    @fcomp = Fcomp.find(params[:id])
  end

  def update
    @fcomp = Fcomp.find(params[:id])
    if @fcomp.update_attributes(fcomp_params)
      flash[:success] = "Company updated"
      redirect_to root_path

    else
      render 'edit'
    end
  end
  
  def fcomp_params
      params.require(:fcomp).permit(:name, :country, :webpage,
                                   :logo, :rules)
    end
end
