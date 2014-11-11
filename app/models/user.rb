class User < ActiveRecord::Base
  validates_presence_of :email, :name, :password_digest, :date_of_birth
  validates_uniqueness_of :email
  has_secure_password
  has_many :prescriptions
  has_many :symptoms
end
