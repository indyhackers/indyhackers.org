require 'uri'

class Redirect < ActiveRecord::Base
  validates :id,  format: /[a-z0-9_]+/i, presence: true
  validates :url, presence: true
  validate :url_is_valid

  def url_is_valid
    unless url =~ URI::regexp
      errors.add(:url, "not a valid url")
    end
  end
end
