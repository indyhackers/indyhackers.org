class JobPostRequestsController < ApplicationController
  def new
    @job_post_request = JobPostRequest.new(:id => 13)
  end

  def create
    @job_post_request = JobPostRequest.new(params[:job_post_request].merge!({:id => 13}))
    if @job_post_request.save
      redirect_to new_job_post_request_path, :notice => 'Your job post request was sent successfully!'
    else
      flash[:notice] = 'There was a problem with sending your job post request'
      render :new
    end
  end
end
