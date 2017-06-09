class SitemapsController < ApplicationController
  respond_to :xml
  caches_action :show

  def show
    @jobs = Job.published
    @posts = Post.published
    @other_routes = ["/","/jobs","/job_post_request","/calendar", "/why_indy"]
    respond_to do |format|
      format.xml
    end
  end
end
