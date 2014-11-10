class User < ActiveRecord::Base
  validates_presence_of :email, :name, :password_digest, :date_of_birth
  has_secure_password
end
