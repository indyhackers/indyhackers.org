class Job < ActiveRecord::Base
  has_many :job_views
  has_many :viewers, :through => :job_views
  belongs_to :user

  scope :published, lambda {
    where("jobs.published_at IS NOT NULL AND jobs.published_at <= ?", Time.zone.now)
  }
end
