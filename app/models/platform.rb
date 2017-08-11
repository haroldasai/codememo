class Platform < ActiveRecord::Base
	validates :name, length: { minimum: 1 }, presence: true
end
