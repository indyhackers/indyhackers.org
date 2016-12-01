require 'uri'

class Redirect < ActiveRecord::Base
  validate :id, format: /[a-z0-9_]+/i
  validate :url_is_valid

  def url_is_valid
    unless url =~ URI::regexp
      errors.add(:url, "not a valid url")
    end
  end
end
