Given /^there is a job with title "([^\"]*)"$/ do |title|
  job = FactoryGirl.build(:job, :title => title)
  job.published_at = 1.day.ago
  job.save
end
