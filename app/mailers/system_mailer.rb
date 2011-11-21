class SystemMailer < ActionMailer::Base
  default :from => "alfred@indyhackers.org"
  default :to => 'miles@indyhackers.org'

  def job_post_request(job_post_request, job)
    @job_post_request = job_post_request
    @job = job
    if job_post_request.attachment.present?
      attachments[job_post_request.attachment.original_filename] = File.read(job_post_request.attachment.tempfile.path)
    end
    mail(
      :subject => "[#{@job_post_request.title}]", 
      :from => %{"#{@job_post_request.name}" <alfred@indyhackers.org>},
      :reply_to => @job_post_request.email
    )
  end

end
