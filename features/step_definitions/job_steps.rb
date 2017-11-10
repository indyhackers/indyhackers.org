Given /^there is a job with title "([^\"]*)"$/ do |title|
  job = FactoryGirl.build(:job, :title => title)
  job.published_at = 1.day.ago
  job.save
end

Given /^I have a job published$/ do
  @user = FactoryGirl.create(:user)
  @job = FactoryGirl.build(:job)
  @job.published_at = 1.day.ago
  @job.user = @user
  @job.save
end

Given "there is an existing job" do
  step "I have a job published"
end

When /^I visit the job\'s edit page from the link in the email$/ do
  visit edit_job_path(@job, :token => @user.token)
end

When 'I go to the jobs list' do
  visit '/jobs'
end

When "I click that job's title" do
  click_link @job.title
end

When 'I fill out a job request form' do
  visit '/job_post_requests/new'
  fill_in 'Name', with: 'Frank Vogel'
  fill_in 'Email', with: 'frank.vogel@pacers.com'
  fill_in 'Title', with: 'Star NBA Coach'
  fill_in 'Description', with: 'An NBA coach who actually cares.'
end

When 'I send the form' do
  click_button 'Send'
end

Then 'I can edit the job' do
  fill_in "Title", :with => "New Awesome Title"
  click_button "Update"
  expect(page).to have_content "Your job post was updated"
  @job.reload
  expect(current_path).to eq edit_job_path(@job)
end

Then /^I can delete the job/ do
  click_button "Delete"
  expect(current_path).to eq jobs_path
  expect(page).not_to have_content @job.title
end

Then 'I should see the title for that job' do
  expect(page).to have_content @job.title
end

Then 'I should see the description for that job' do
  expect(page).to have_content @job.description
end

Then 'I should see that the job request was sent successfully' do
  expect(page).to have_content 'sent successfully'
end
