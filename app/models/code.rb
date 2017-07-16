class Code < ActiveRecord::Base
  enum language: [:JavaScript, :Ruby, :Java, :Python, :PHP]	
  belongs_to :tip
  belongs_to :user
  belongs_to :language		
end
