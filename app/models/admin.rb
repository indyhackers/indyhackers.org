class Admin < ActiveRecord::Base
  devise :database_authenticatable, :validatable, :lockable

end
