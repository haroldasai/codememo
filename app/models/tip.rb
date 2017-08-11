class Tip < ActiveRecord::Base
    has_many :codes
    has_many :commands
    belongs_to :user
    belongs_to :topic

    validates :title, length: { minimum: 1 }, presence: true
end
