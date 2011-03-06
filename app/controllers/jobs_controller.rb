class JobsController < InheritedResources::Base
  respond_to :atom, :only => :index
  respond_to :xml, :only => :index
  actions :index, :show

  def collection
    @jobs = Job.order("created_at DESC").all
  end
end
