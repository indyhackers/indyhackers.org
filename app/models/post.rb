require File.join(Rails.root, 'lib', 'slug')
class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  include IndyHackers::Slug

  before_save :generate_html

  scope :published, lambda {
    where("posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now)
  }

  def generate_html
    self.body_html = MARKDOWN.render(body)
  end
end
