class Topic < ActiveRecord::Base
	has_many :tips
	belongs_to :category

	validates :name, length: { minimum: 1 }, presence: true
end
