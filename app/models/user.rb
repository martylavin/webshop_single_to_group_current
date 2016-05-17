class User < ActiveRecord::Base
  #belongs_to :admin

  validates :name, presence: true
  validates :email, presence: true, 
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  def self.search(search)
     where("name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end

end
