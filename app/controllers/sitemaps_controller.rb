class SitemapsController < ApplicationController
  respond_to :xml
  caches_page :show

  def show
    @jobs = Job.published
    @other_routes = ["/","/jobs","/job_post_request","/calendar"]
    respond_to do |format|
      format.xml
    end
  end
end
