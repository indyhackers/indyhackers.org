class SystemMailer < ActionMailer::Base
  default from: "alfred@indyhackers.org"
  default to: "board@indyhackers.org"

  def job_post_request(job_post_request, job)
    @job_post_request = job_post_request
    @job = job
    mail(
      subject: "[IndyHackers Jobs] #{@job_post_request.title}",
      from: %("#{@job_post_request.name}" <alfred@indyhackers.org>),
      reply_to: @job_post_request.email
    )
  end

  def job_post_published(user, job)
    @user = user
    @job = job
    send_to = @user.present? ? [@user.email, "board@indyhackers.org"] : "board@indyhackers.org"
    mail(
      subject: "[IndyHackers Jobs] Published! #{@job.title}",
      from: %("IndyHackers" <alfred@indyhackers.org>),
      reply_to: "board@indyhackers.org",
      to: send_to
    )
  end
end
