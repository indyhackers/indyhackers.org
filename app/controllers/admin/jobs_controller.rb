class Admin::JobsController < InheritedResources::Base
  respond_to :html

  before_filter :authenticate_admin!
  skip_before_filter :verify_authenticity_token, :only => :destroy

  def new
    @job = Job.new
  end

  def update
    @job = resource
    @job.published_at = Time.now if params[:job].slice(:published_at).present?
    if @job.update_attributes(params[:job])
      redirect_to @job, :notice => 'Job was updated successfully'
    else
      render :edit
    end
  end

  def collection
    @jobs = Job.order("created_at DESC").all
  end

  def resource
    @job = Job.find_using_slug(params[:id])
  end
end
