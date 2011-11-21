class Job < ActiveRecord::Base
  has_many :job_views
  has_many :viewers, :through => :job_views
end
