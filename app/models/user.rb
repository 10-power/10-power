class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password
end
