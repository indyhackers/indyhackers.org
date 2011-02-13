class JobsController < InheritedResources::Base
  respond_to :atom, :only => :index
  respond_to :xml, :only => :index
  before_filter :authenticate_admin!, :except => [:index, :show]
end
