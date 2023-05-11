class SitemapsController < ApplicationController
  respond_to :xml

  def show
    @jobs = Rails.cache.fetch("sitemap_jobs", expires_in: 1.day) { Job.active }
    @other_routes = ["/", "/jobs", "/job_post_request", "/calendar", "/why_indy"]
    respond_to do |format|
      format.xml
    end
  end
end
