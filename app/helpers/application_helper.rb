module ApplicationHelper
  # Help individual pages to set their HTML titles
  def title(text)
    content_for(:title) { text }
  end

  # Help individual pages to set their HTML meta descriptions
  def description(text)
    content_for(:description) { "<meta content=\"#{text}\" name=\"Description\" />".html_safe }
  end

  def admin_header
    return unless admin_signed_in?

    render partial: "shared/admin_header"
  end
end
