class CommandsController < ApplicationController
  def new
  	@tip = Tip.find(params[:tip_id])
  	@command = Command.new
  	@platforms = Platform.all
  end

  def create
    @tip = Tip.find(params[:tip_id])
    @command = @tip.commands.build(command_params)
    @command.platform_ids = params[:command][:platform_ids].join(",")
    @command.user = current_user
  # #10
    if @command.save
  # #11
      flash[:notice] = "command was saved."
      redirect_to [@tip.topic, @tip]
    else
  # #12
      flash.now[:alert] = "There was an error saving the command. Please try again."
      render :new
    end
  end

  def edit
  	@command = Command.find(params[:id])
  	@array = @command.platform_ids.split(",")
  	@platforms = Platform.all
  end

  def update
    @command = Command.find(params[:id])
    @command.assign_attributes(command_params)
    @command.platform_ids = params[:command][:platform_ids].join(",")

    if @command.save
      flash[:notice] = "command was updated."
      redirect_to [@command.tip.topic, @command.tip]
    else
      flash.now[:alert] = "There was an error saving the command. Please try again."
      render :edit
    end
  end

  def destroy
    @command = Command.find(params[:id])
    @tip = @command.tip
 # #8
    if @command.destroy
      flash[:notice] = "command with id:#{@command.id} was deleted successfully."
      redirect_to [@tip.topic, @tip]
    else
      flash.now[:alert] = "There was an error deleting the command."
      render :show
    end
  end

  private
 
  def command_params
    params.require(:command).permit(:description, :command, :app_version, :url)
  end
end
