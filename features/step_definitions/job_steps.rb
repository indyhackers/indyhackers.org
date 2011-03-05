Given /^there is a job with title "([^\"]*)"$/ do |title|
  Factory(:job, :title => title)
end
