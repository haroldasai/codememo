class Language < ActiveRecord::Base
	has_many :codes

	validates :name, length: { minimum: 1 }, presence: true
end
