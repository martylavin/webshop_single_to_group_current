class Admin < ActiveRecord::Base
  has_secure_password
  #has_many :users, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true, 
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

 
end
