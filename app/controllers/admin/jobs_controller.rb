class Admin::JobsController < InheritedResources::Base
  respond_to :html

  before_action :authenticate_admin!
  skip_before_action :verify_authenticity_token, :only => :destroy

  def new
    @job = Job.new
  end

  def update
    @job = resource
    if @job.update(job_params)
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

  private

  def job_params
    params.require(:job).permit(:title, :description, :company, :published_at)
  end
end
