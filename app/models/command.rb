class Command < ActiveRecord::Base
  belongs_to :tip
  belongs_to :user

  validates :command, length: { minimum: 1 }, presence: true
end
