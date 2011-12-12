require "digest/md5"
class JobsController < InheritedResources::Base
  respond_to :atom, :only => :index
  respond_to :xml, :only => :index
  actions :index, :show, :destroy
  before_filter :authenticate_by_token, :only => [:manage, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :viewed

  def collection
    @jobs = Job.published.order("created_at DESC").all
  end

  def resource
    if params[:id].to_i == 0
      @job = Job.find_by_slug(params[:id])
    else
      @job = Job.find_by_id(params[:id])
    end
  end

  def show
    if resource.blank?
      redirect_to(jobs_path, :notice => "Couldn't find that job. It may have been filled. Sorry!") and return
    end
  end

  def manage
    @job = resource
  end

  def viewed
    @job = Job.find(params[:id])
    if cookies['_ih_uid'].nil?
      cookies['_ih_uid'] = Digest::MD5.hexdigest(Time.now.to_s + rand(13000).to_s)
    end
    @viewer = Viewer.find_or_create_by_client_hash(cookies['_ih_uid'])
    unless @viewer.viewed?(@job)
      @job.viewers << @viewer
      @job.views = @job.views.nil? ? 1 : @job.views + 1
      @job.save
    end
    render :text => "Success!"
  end

  private

  def authenticate_by_token
    @job = resource
    @user = User.find_by_token(params[:token]) unless params[:token].nil?
    unless @user.present? && @job.user == @user
      redirect_to jobs_url, :notice => "*gasp* You shouldn't be snooping around there! FOR SHAME!"
    end
  end
end
