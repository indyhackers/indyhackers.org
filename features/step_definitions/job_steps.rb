Given /^there is a job with title "([^\"]*)"$/ do |title|
  job = FactoryGirl.build(:job, :title => title)
  job.published_at = 1.day.ago
  job.save
end

Given /^I have had a job post published$/ do
  @user = FactoryGirl.create(:user)
  @job = FactoryGirl.build(:job)
  @job.published_at = 1.day.ago
  @job.user = @user
  @job.save
end

When /^I visit the job\'s edit page with my token$/ do
  visit edit_job_path(@job, :token => @user.token)
end

Then /^I should be able to edit the post$/ do
  fill_in "Title", :with => "New Awesome Title"
  click_button "Update"
  page.should have_content "Your job post was updated"
  @job.reload
  current_path.should == edit_job_path(@job)
end

Then /^I should be able to delete the post$/ do
  click_button "Delete"
  current_path.should == jobs_path
  page.should_not have_content @job.title
end
