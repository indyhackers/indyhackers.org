Given /^I am logged in as "(.*)"$/ do |email|
  Given %Q{I login as "#{email}" with password "test"}
  page.should have_content('Signed in')
end

Given /^I login as "(.*)" with password "(.*)"$/ do |email, password|
  @current_user = Factory(:admin, :email => email, :password => password)
  visit new_user_session_path
  fill_in('Email', :with => @current_user.email)
  fill_in('Password', :with => password)
  click_button('Sign in')
end
