class Viewer < ActiveRecord::Base
  has_many :job_views
  has_many :jobs, :through => :job_views

  def viewed?(job)
    jobs.include?(job)
  end
end
