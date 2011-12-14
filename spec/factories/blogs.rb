# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
      body "MyText"
      body_html "MyText"
      title "MyString"
      published_at "2011-12-13 23:08:53"
      slug "MyString"
    end
end