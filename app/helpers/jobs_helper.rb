module JobsHelper
  def job_view_links
    %w[all unpublished active expired].map do |filter_type|
      label = "#{filter_type.titleize} Jobs"
      if params[:job_view] == filter_type
        tag.span label
      else
        link_to label, admin_jobs_path(page: params[:page], job_view: filter_type)
      end
    end.join(" | ").html_safe
  end
end
