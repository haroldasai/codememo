class TopicsController < ApplicationController

  def index
    @root = Topic.find(0)
    @topics = Topic.where.not(id: 0)
    
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

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @topic = Topic.new
    @topics = Topic.where(category_id: @category)
    @topics.unshift(Topic.find(0))
  end

  def create
    @category = Category.find(params[:category_id])
    @topic = Topic.new(topic_params)
    @topic.category = @category

    if @topic.save
      redirect_to [@category, @topic], notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    topics = Topic.where(category_id: @topic.category)
    @topics = topics.where.not(id: params[:id])
    @topics.unshift(Topic.find(0))
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
 
    if @topic.save
      flash[:notice] = "Topic was updated."
      redirect_to [@topic.category, @topic]
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end  

  def destroy
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:id])
 
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to @category
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private
 
  def topic_params
    params.require(:topic).permit(:name, :description, :topic_id)
  end  
end
