class TipsController < ApplicationController
  def show
  	@tip = Tip.find(params[:id])
    @languages = Language.all
    @platforms = Platform.all
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@tip = Tip.new
  end

def create
  # #9
    @topic = Topic.find(params[:topic_id])
    @tip = @topic.tips.build(tip_params)
    @tip.user = current_user
  # #10
    if @tip.save
  # #11
      flash[:notice] = "Tip was saved."
      redirect_to [@topic, @tip]
    else
  # #12
      flash.now[:alert] = "There was an error saving the tip. Please try again."
      render :new
    end
  end

  def edit
    @tip = Tip.find(params[:id])
  end

  def update
    @tip = Tip.find(params[:id])
    @tip.assign_attributes(tip_params)

    if @tip.save
      flash[:notice] = "Tip was updated."
      redirect_to [@tip.topic, @tip]
    else
      flash.now[:alert] = "There was an error saving the tip. Please try again."
      render :edit
    end
  end

  def destroy
    @tip = Tip.find(params[:id])
 
 # #8
    if @tip.destroy
      flash[:notice] = "\"#{@tip.title}\" was deleted successfully."
      redirect_to [@tip.topic.category, @tip.topic]
    else
      flash.now[:alert] = "There was an error deleting the tip."
      render :show
    end
  end

  private
 
  def tip_params
    params.require(:tip).permit(:title, :description)
  end

end
