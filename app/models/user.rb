class User < ActiveRecord::Base
  validates :username, presence:true
  validates :email, uniqueness: { case_sensitive: false }, presence:true
  has_secure_password
end
