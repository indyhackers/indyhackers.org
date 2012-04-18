require "digest/md5"
class JobsController < ApplicationController
  before_filter :authenticate_by_token, :only => [:edit, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :viewed

  def index
    @jobs = Job.published.order("created_at DESC").all
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
      format.rss { redirect_to jobs_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def show
    if find_job.blank?
      redirect_to(jobs_path, :notice => "Couldn't find that job. It may have been filled. Sorry!") and return
    end
  end

  def edit
    find_job
  end

  def update
    find_job
    if @job.update_attributes(params[:job])
      redirect_to edit_job_path(@job, :token => params[:token]), :notice => 'Your job post was updated'
     else
      render :edit
    end
  end

  def viewed
    find_job
    if cookies['_ih_uid'].nil?
      cookies['_ih_uid'] = Digest::MD5.hexdigest(Time.now.to_s + rand(13000).to_s)
    end
    @viewer = Viewer.find_or_create_by_client_hash(cookies['_ih_uid'])
    unless @viewer.viewed?(@job)
      @job.viewers << @viewer
      @job.views = @job.views.nil? ? 1 : @job.views + 1
      @job.save
      INSTRUMENTAL.increment(@job.slug + "_viewed")
    end
    render :text => "Success!"
  end

  def destroy
    find_job
    @job.destroy
    redirect_to jobs_path, :notice => "Job post deleted. Thanks!"
  end

  private

  def authenticate_by_token
    find_job
    @user = User.find_by_token(params[:token]) unless params[:token].nil?
    unless @user.present? && @job.user == @user
      redirect_to jobs_url, :notice => "*gasp* You shouldn't be snooping around there! FOR SHAME!"
    end
  end

  def find_job
    @job = Job.find_using_slug(params[:id])
  end
end
