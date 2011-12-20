class PostsController < InheritedResources::Base
  respond_to :html, :atom, :rss

  def index
    super do |format|
      format.html
      format.atom { render :layout => false }
      format.rss { redirect_to blog_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def collection
    @posts = Post.order("created_at DESC").all
  end

  def resource
    if params[:id].to_i == 0
      Post.find_by_slug(params[:id])
    else
      Post.find_by_id(params[:id])
    end
  end
end
