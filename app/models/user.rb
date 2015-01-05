class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, presence:true  
end
