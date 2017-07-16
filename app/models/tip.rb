class Tip < ActiveRecord::Base
    has_many :codes
    belongs_to :user
    belongs_to :topic

    validates :title, length: { minimum: 5 }, presence: true
end
