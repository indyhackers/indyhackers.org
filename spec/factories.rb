FactoryGirl.define do
  factory :job do
    title Faker::Lorem.words.join(' ')
    description Faker::Lorem.paragraphs.join
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
