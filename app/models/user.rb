class User < ActiveRecord::Base
  #belongs_to :admin

  validates :name, presence: true
  validates :email, presence: true, 
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  #def to_s
  #  title
  #end
  
end
