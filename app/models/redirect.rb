require "uri"

class Redirect < ActiveRecord::Base
  validates :id,  format: /[a-z0-9_]+/i, presence: true, length: { maximum: 32 }
  validates :url, presence: true, length: { maximum: 2083 }
  validate :url_is_valid

  def url_is_valid
    return if url =~ URI::DEFAULT_PARSER.make_regexp

    errors.add(:url, "not a valid url")
  end

  def visit!
    update!(last_visited_at: Time.now, visits: visits + 1)
  end
end
