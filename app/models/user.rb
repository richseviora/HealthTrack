class User < ActiveRecord::Base
  validates_presence_of :email, :name, :password_digest
  validates_numericality_of :date_of_birth
  has_secure_password
end
