class User < ActiveRecord::Base
  has_many :jobs

  before_create :create_token

  def create_token
    self.token = Digest::MD5.hexdigest(name + email + Time.zone.now.to_s)
  end
end
