class Admin::JobsController < ApplicationController
  before_action :authenticate_admin!
  before_action :fetch_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => :destroy

  def index
    @jobs = Job.order(created_at: :desc)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_job_path(@job), :notice => 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job), :notice => 'Job was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, notice: 'Job was successfully destroyed.'
  end

  private

  def fetch_job
    @job = Job.find_using_slug(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company, :published_at)
  end
end
