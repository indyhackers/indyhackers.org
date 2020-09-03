require File.join(Rails.root, 'lib', 'slug')
class Job < ActiveRecord::Base
  is_sluggable :name

  has_many :job_views, :dependent => :destroy
  has_many :viewers, :through => :job_views
  belongs_to :user

  attr_accessor :publish_now

  after_update :notify_if_published

  class << self
    # Jobs that should appear in public listings
    #
    # @returns [ActiveRecord::Relation<Job>] active jobs

    def active
      published.where("jobs.published_at >= ?", 60.days.ago)
    end

    private

    def published
      where(
        "jobs.published_at IS NOT NULL AND jobs.published_at <= ?",
        Time.zone.now
      )
    end
  end

  def name
    "#{title} at #{company}"
  end

  # The 'slugged' gem expects this method to exist, as it's expecting the
  # method to be an AR attribute.
  def name_changed?
    title_changed? || company_changed?
  end

  def notify_if_published
    if saved_change_to_published_at? && published_at.present? && published_at <= Time.now
      SystemMailer.job_post_published(self.user, self).deliver
    else
      Rails.logger.info "OMG WTF BBQ"
    end
  end
end
