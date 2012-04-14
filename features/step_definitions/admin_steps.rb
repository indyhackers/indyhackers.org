Given /^I am signed up as "([^\"]*)"$/ do |email|
  FactoryGirl.create(:admin, :email => email, :password => "rockstar")
end

Given /^I am signed up as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  FactoryGirl.create(:admin, :email => email, :password => password)
end
Given /^I am logged in as "(.*)"$/ do |email|
  step %Q{I login as "#{email}" with password "rockstar"}
  page.should have_content('Signed in')
end

Given /^I login as "(.*)" with password "(.*)"$/ do |email, password|
  @current_user = FactoryGirl.create(:admin, :email => email, :password => password)
  visit new_admin_session_path
  fill_in('Email', :with => @current_user.email)
  fill_in('Password', :with => password)
  click_button('Sign in')
end
