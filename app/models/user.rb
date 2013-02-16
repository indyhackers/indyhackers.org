class User < ActiveRecord::Base
  attr_accessible :email, :name, :token
  has_many :jobs

  before_create :create_token

  def create_token
    self.token = Digest::MD5.hexdigest(self.name + self.email + Time.zone.now.to_s)
  end
end
