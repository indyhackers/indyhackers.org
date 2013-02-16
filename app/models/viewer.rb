class Viewer < ActiveRecord::Base
  has_many :job_views
  has_many :jobs, :through => :job_views

  attr_accessible :client_hash

  def viewed?(job)
    jobs.include?(job)
  end
end
