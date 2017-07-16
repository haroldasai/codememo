class LanguagesController < ApplicationController
  def index
  	@languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    if @language.save
      redirect_to languages_path, notice: "Language was saved successfully."
    else
      flash.now[:alert] = "Error creating language. Please try again."
      render :new
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
 
    @language.assign_attributes(language_params)
 
    if @language.save
      flash[:notice] = "Language was updated."
      redirect_to @language
    else
      flash.now[:alert] = "Error saving language. Please try again."
      render :edit
    end
  end  

  def destroy
    @language = Language.find(params[:id])
 
    if @language.destroy
      flash[:notice] = "\"#{@language.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the language."
      render :show
    end
  end
  
  private
 
  def language_params
    params.require(:language).permit(:name, :version)
  end
end
