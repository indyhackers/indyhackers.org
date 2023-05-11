module IndyHackers
  module Slug
    def self.included(base)
      base.before_create :create_slug
    end

    def create_slug
      self.slug = escaped_title
    end

    def escaped_title
      title.downcase.gsub(/[^a-zA-Z0-9]/, "-").gsub(/-{2,}/, "-").gsub(/-$/, "")
    end
  end
end
