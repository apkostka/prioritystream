class User < ActiveRecord::Base
  attr_accessible :color, :email, :name

  has_many :tasks
  
  validates :color, :length => { :maximum => 6 }
end
