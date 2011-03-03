class Admin::JobsController < InheritedResources::Base
  respond_to :html

  before_filter :authenticate_admin!
end
