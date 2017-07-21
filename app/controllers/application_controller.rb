class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_page

  def set_page
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
end
