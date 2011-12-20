class Admin::PostsController < InheritedResources::Base
  respond_to :html

  before_filter :authenticate_admin!
  skip_before_filter :verify_authenticity_token, :only => :destroy

  def create
    create!(:notice => "Dude! Nice job creating that post.") { posts_url }
  end

  def collection
    @posts = Post.order("created_at DESC").all
  end
end
