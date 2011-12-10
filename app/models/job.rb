class Job < ActiveRecord::Base
  has_many :job_views
  has_many :viewers, :through => :job_views
  belongs_to :user

  before_create :create_slug
  after_update :notify_if_published

  scope :published, lambda {
    where("jobs.published_at IS NOT NULL AND jobs.published_at <= ?", Time.zone.now)
  }

  def create_slug
    self.slug = title.downcase.gsub(/[^a-zA-Z0-9]/, '-').gsub('-{2,}', '-')
  end

  def notify_if_published
    if published_at_changed? && published_at.present? && published_at <= Time.now
      SystemMailer.job_post_published(self.user, self).deliver
    else
      Rails.logger.info "OMG WTF BBQ"
    end
  end
end
