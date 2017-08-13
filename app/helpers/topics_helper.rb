module TopicsHelper
  def topic_link_label(topic)
    link_label = topic.name
    current_topic = topic
    until current_topic.topic_id == 0 do
      parent_topic = Topic.find(current_topic.topic_id).name
      link_label = parent_topic + "-" + link_label
      current_topic = Topic.find(current_topic.topic_id)
    end
    link_label
  end 
end
