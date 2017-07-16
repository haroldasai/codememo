class Topic < ActiveRecord::Base
	has_many :tips

	validates :name, length: { minimum: 1 }, presence: true
end
