FactoryGirl.define do
  factory :job do
    title 'Awesome Job'
    description <<-MARKDOWN
    This is an awesome job. You can tell this is an awesome job by the bullet points.
      + Has awesome people
      + Has awesome perks
      + Has coffee
      + Has awesome workplace (psst, it's your home)
      + Has awesome moneys (we pay in yen)
    MARKDOWN
  end

  factory :admin do
    sequence :email do |n|
      "#{Faker::Internet.user_name}#{n}@example.org"
    end
  end

  factory :viewer do
    client_hash "asdfqwrogrwhoashogasdfgioha455"
  end

  factory :user do
    sequence :email do |n|
      "#{Faker::Internet.user_name}#{n}@example.org"
    end
    name "#{Faker::Name.name}"
  end
end
