class SystemMailer < ActionMailer::Base
  default :from => "alfred@indyhackers.org"
  default :to => 'miles@indyhackers.org'

  def feedback(job_post_request)
    @job_post_request = job_post_request
    if job_post_request.attachment.present?
      attachments[job_post_request.attachment.original_filename] = File.read(job_post_request.attachment.tempfile.path)
    end
    mail(:subject => "[#{@job_post_request.issue_type}]")
  end

end
