class Admin::JobsController < InheritedResources::Base
  respond_to :html

  before_filter :authenticate_admin!
  skip_before_filter :verify_authenticity_token, :only => :destroy

  def collection
    @jobs = Job.order("created_at DESC").all
  end
end
