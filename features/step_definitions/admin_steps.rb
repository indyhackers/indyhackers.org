Given /^I am signed up as "([^\"]*)"$/ do |email|
  FactoryBot.create(:admin, :email => email, :password => "rockstar")
end

Given /^I am signed up as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  FactoryBot.create(:admin, :email => email, :password => password)
end

Given 'I am logged in as an admin' do
  step 'I am an admin'
  step 'I attempt to login'
end

Given /^I login as "(.*)" with password "(.*)"$/ do |email, password|
  @current_user = FactoryBot.create(:admin, :email => email, :password => password)
  visit new_admin_session_path
  fill_in('Email', :with => @current_user.email)
  fill_in('Password', :with => password)
  click_button('Sign in')
end

Given 'I am an admin' do
  @current_user = FactoryBot.create(:admin, email: 'admin@example.com', password: 'password')
end

When 'I attempt to login' do
  visit new_admin_session_path
  fill_in 'Email', with: @current_user.email
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end

When 'I fill out and submit the new job form' do
  visit '/admin/jobs/new'
  fill_in 'Title', with: 'Pacers Assistant Coach'
  fill_in 'Description', with: "Someone who sits at the end of the bench and keeps Roy Hibbert's confidence level high"
  click_button 'Save'
end

When 'I edit an existing job' do
  step 'there is an existing job'
  visit edit_admin_job_path(@job)
  fill_in 'Title', with: @job.title + ' FAST'
  click_button 'Save'
end

Then 'I should be signed in successfully' do
  expect(page).to have_content 'Signed in successfully'
end

Then 'I see the saved job' do
  expect(page).to have_content /success/
  expect(page).to have_content 'Pacers Assistant Coach'
  expect(page).to have_content "Someone who sits at the end of the bench and keeps Roy Hibbert's confidence level high"
end

Then 'I see the updated job' do
  expect(page).to have_content /success/
  expect(page).to have_content @job.title + ' FAST'
end
