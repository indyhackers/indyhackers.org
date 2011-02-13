class Admin < ActiveRecord::Base
  devise :database_authenticatable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
