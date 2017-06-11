require File.join(Rails.root, 'lib', 'slug')
class Job < ActiveRecord::Base
  is_sluggable :title

  has_many :job_views, :dependent => :destroy
  has_many :viewers, :through => :job_views
  belongs_to :user

  attr_accessor :publish_now

  after_commit :notify_if_published, :on => :update

  scope :published, lambda {
    where("jobs.published_at IS NOT NULL AND jobs.published_at <= ?", Time.zone.now)
  }

  scope :stale, lambda {
    where("created_at < ?", 60.days.ago)
  }

  def notify_if_published
    if previous_changes.has_key?('published_at') && published_at.present? && published_at <= Time.now
      SystemMailer.job_post_published(self.user, self).deliver
    else
      Rails.logger.info "OMG WTF BBQ"
    end
  end
end
