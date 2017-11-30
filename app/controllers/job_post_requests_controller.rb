class JobPostRequestsController < ApplicationController
  def new
    @job_post_request = JobPostRequest.new(:id => 13)
  end

  def create
    @job_post_request = JobPostRequest.new(job_post_request_params.merge!({:id => 13}))
    if @job_post_request.valid?
      @user = User.find_or_create_by!(:name => @job_post_request.name, :email => @job_post_request.email)
      @job = Job.new(
        title: @job_post_request.title,
        description: @job_post_request.description,
        company: @job_post_request.company,
      )
      @job.user = @user
      @job.save
      SystemMailer.job_post_request(@job_post_request, @job).deliver
      redirect_to new_job_post_request_path, :notice => 'Your job post request was sent successfully!'
    else
      flash[:notice] = 'There was a problem with sending your job post request'
      render :new
    end
  end

  private

  def job_post_request_params
    params[:job_post_request].permit(:name, :email, :title, :company, :description)
  end
end
