require File.join(Rails.root, 'lib', 'slug')
class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  include IndyHackers::Slug

  before_save :generate_html

  def generate_html
    self.body_html = MARKDOWN.render(body)
  end
end
