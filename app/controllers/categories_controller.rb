class CategoriesController < ApplicationController
  def index
  end

  def show
  	@category = Category.find(params[:id])
  	@topics = Topic.where(category_id: @category)

  	@root = Topic.find(0)
    
    map = {}
    
    @topics.each do |e|
      map[e[:id]] = e
    end
    
    @tree = {}
    
    @topics.each do |e|
      pid = e[:topic_id]
      if pid == nil || !map.has_key?(pid)
        (@tree[@root] ||= []) << e
      else
        (@tree[map[pid]] ||= []) << e
      end
    end

  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating category. Please try again."
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id]) 
    @category.assign_attributes(category_params)
 
    if @category.save
      redirect_to @category, notice: "\"#{@category.name}\" was updated."
    else
      flash.now[:alert] = "Error saving language. Please try again."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
 
    if @category.destroy
      flash[:notice] = "\"#{@category.name}\" was deleted successfully."
      redirect_to Category.first
    else
      flash.now[:alert] = "There was an error deleting the language."
      redirect_to action: :show
    end
  end    

  private
 
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
