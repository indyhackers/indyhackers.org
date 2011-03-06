class Admin::JobsController < InheritedResources::Base
  respond_to :html

  before_filter :authenticate_admin!

  def collection
    @jobs = Job.order("created_at DESC").all
  end
end
