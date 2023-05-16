require "digest/md5"
class JobsController < ApplicationController
  before_action :authenticate_by_token, only: %i[edit destroy]

  def index
    @jobs = Job.active.order("created_at DESC")
    respond_to do |format|
      format.html
      format.atom { render layout: false }
      format.rss { redirect_to jobs_path(format: :atom), status: :moved_permanently }
    end
  end

  def show
    if find_job.blank?
      redirect_to(jobs_path, notice: "Couldn't find that job. It may have been filled. Sorry!") and return
    end

    increment_job_views!
  end

  def edit
    find_job
  end

  def update
    find_job
    if @job.update(job_params)
      redirect_to edit_job_path(@job, token: params[:token]), notice: "Your job post was updated"
    else
      render :edit
    end
  end

  def destroy
    find_job
    @job.destroy
    redirect_to jobs_path, notice: "Job post deleted. Thanks!"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company, :published_at)
  end

  def authenticate_by_token
    find_job
    @user = User.find_by_token(params[:token]) unless params[:token].nil?
    return if @user.present? && @job.user == @user

    redirect_to jobs_url, notice: "*gasp* You shouldn't be snooping around there! FOR SHAME!"
  end

  def find_job
    @job = Job.find_using_slug(params[:id])
  end

  def increment_job_views!
    set_cookie_ih_id!
    viewer = viewer_from_cookie

    return if viewer.viewed?(@job)

    @job.viewers << viewer
    @job.increment_views
    @job.save
  end

  def set_cookie_ih_id!
    cookies["_ih_uid"] = Digest::MD5.hexdigest(Time.now.to_s + rand(13_000).to_s) if cookies["_ih_uid"].nil?
  end

  def viewer_from_cookie
    Viewer.find_or_create_by!(client_hash: cookies["_ih_uid"])
  end
end
