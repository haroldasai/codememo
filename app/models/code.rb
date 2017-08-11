class Code < ActiveRecord::Base
  enum language: [:JavaScript, :Ruby, :Java, :Python, :PHP]	
  belongs_to :tip
  belongs_to :user
  belongs_to :language		

  validates :body, length: { minimum: 1 }, presence: true
end
