class User < ActiveRecord::Base
  has_many :jobs

  def create_token
    self.token = Digest::MD5.hexdigest(self.name + self.email + Time.zone.now.to_s)
    save
  end
end
