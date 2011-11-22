require "digest/md5"
class JobsController < InheritedResources::Base
  respond_to :atom, :only => :index
  respond_to :xml, :only => :index
  actions :index, :show, :destroy
  before_filter :authenticate_by_token, :only => [:show, :destroy]

  def collection
    @jobs = Job.published.order("created_at DESC").all
  end

  def viewed
    @job = Job.find(params[:id])
    @viewer = Viewer.find_or_create_by_client_hash(Digest::MD5.hexdigest(request.remote_ip + request.user_agent))
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
