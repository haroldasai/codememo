class AddTopicToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :topic, index: true, foreign_key: true
  end
end
