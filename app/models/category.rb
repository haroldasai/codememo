class Category < ActiveRecord::Base
	has_many :topics
	
	validates :name, length: { minimum: 1 }, presence: true
end
