namespace :admin do
  desc "If the title already contains 'at Company Name', remove it and put it in the company field"
  task fix_job_titles: :environment do
    Job.where(company: nil).each do |job|
      job.title, job.company = job.title.split(" at ")
      job.save!
    end
  end
end
