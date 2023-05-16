class Job < ActiveRecord::Base
  is_sluggable :name

  has_many :job_views, dependent: :destroy
  has_many :viewers, through: :job_views
  belongs_to :user, optional: true

  attr_accessor :publish_now

  after_update :notify_if_published

  class << self
    def active
      published.where("jobs.published_at >= :date", date: 60.days.ago)
    end

    def expired
      published.where("jobs.published_at < :date", date: 60.days.ago)
    end

    def unpublished
      where(published_at: nil)
    end

    def from_job_post_request(job_post_request)
      Job.new(
        title: job_post_request.title,
        description: job_post_request.description,
        company: job_post_request.company,
        salary: job_post_request.salary,
      )
    end

    private

    def published
      where.not(published_at: nil)
           .where("published_at <= :date", date: Time.zone.now)
    end
  end

  def name
    "#{title} at #{company}"
  end

  # The 'slugged' gem expects this method to exist, as it's expecting the
  # method to be an AR attribute.
  def name_changed?
    will_save_change_to_title? || will_save_change_to_company?
  end

  # Compatibility method for slugged gem due to current Rails changes to the "ActiveModel::Dirty" methods
  def slug_was
    slug_before_last_save
  end

  # Compatibility method for slugged gem due to current Rails changes to the "ActiveModel::Dirty" methods
  def cached_slug_was
    cached_slug_before_last_save
  end

  # Compatibility method for slugged gem due to current Rails changes to the "ActiveModel::Dirty" methods
  def slug_changed?
    saved_change_to_slug?
  end

  # Compatibility method for slugged gem due to current Rails changes to the "ActiveModel::Dirty" methods
  def cached_slug_changed?
    saved_change_to_cached_slug?
  end

  def notify_if_published
    return unless recently_published?

    SystemMailer.job_post_published(user, self).deliver_now
  end

  def increment_views
    self.views = views.nil? ? 1 : views + 1
  end

  private

  def recently_published?
    saved_change_to_published_at? && published_at.present? && published_at <= Time.now
  end
end
