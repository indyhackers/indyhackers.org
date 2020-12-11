require File.join(Rails.root, 'lib', 'slug')
class Job < ActiveRecord::Base
  is_sluggable :name

  has_many :job_views, :dependent => :destroy
  has_many :viewers, :through => :job_views
  belongs_to :user, :optional => true

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
    if saved_change_to_published_at? && published_at.present? && published_at <= Time.now
      SystemMailer.job_post_published(self.user, self).deliver
    else
      Rails.logger.info "OMG WTF BBQ"
    end
  end
end
