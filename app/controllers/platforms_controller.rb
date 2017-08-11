class PlatformsController < ApplicationController
  def index
  	@platforms = Platform.all
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)
    @platform.label_name = @platform.name + @platform.version

    if @platform.save
      redirect_to platforms_path, notice: "\"#{@platform.name}\" was saved successfully."
    else
      flash.now[:alert] = "Error creating platform. Please try again."
      render :new
    end
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def update
    @platform = Platform.find(params[:id])
 
    @platform.assign_attributes(platform_params)
    @platform.label_name = @platform.name + @platform.version
    if @platform.save
      redirect_to platforms_path, notice: "\"#{@platform.name}\" was updated."
    else
      flash.now[:alert] = "Error saving platform. Please try again."
      render :edit
    end
  end  

  def destroy
    @platform = Platform.find(params[:id])
 
    if @platform.destroy
      flash[:notice] = "\"#{@platform.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the platform."
      redirect_to action: :index
    end
  end
  
  private
 
  def platform_params
    params.require(:platform).permit(:name, :version)
  end
end
