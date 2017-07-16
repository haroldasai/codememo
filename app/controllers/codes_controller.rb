class CodesController < ApplicationController
  def edit
  	@code = Code.find(params[:id])
  	@languages = Language.all
  end

  def new
  	@tip = Tip.find(params[:tip_id])
  	@code = Code.new
  	@languages = Language.all
  end

  def create
    @tip = Tip.find(params[:tip_id])
    @code = @tip.codes.build(code_params)
    @code.user = current_user
  # #10
    if @code.save
  # #11
      flash[:notice] = "Code was saved."
      redirect_to [@tip.topic, @tip]
    else
  # #12
      flash.now[:alert] = "There was an error saving the code. Please try again."
      render :new
    end
  end

  def update
    @code = Code.find(params[:id])
    @code.assign_attributes(code_params)

    if @code.save
      flash[:notice] = "Code was updated."
      redirect_to [@code.tip.topic, @code.tip]
    else
      flash.now[:alert] = "There was an error saving the code. Please try again."
      render :edit
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @tip = @code.tip
 # #8
    if @code.destroy
      flash[:notice] = "\"#{Language.find(@code.language_id).name}\" was deleted successfully."
      redirect_to [@tip.topic, @tip]
    else
      flash.now[:alert] = "There was an error deleting the code."
      render :show
    end
  end

  private
 
  def code_params
    params.require(:code).permit(:body, :language_id)
  end
end
