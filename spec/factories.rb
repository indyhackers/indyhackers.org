FactoryBot.define do
  factory :job do
    title { Faker::Lorem.words.join(' ') }
    company { Faker::Company.name }
    description { Faker::Lorem.paragraphs.join }

    trait :unpublished do
      published_at { nil }
    end

    trait :published do
      published_at { 1.day.ago }
    end

    trait :published_in_future do
      published_at { 1.day.from_now }
    end

    trait :no_longer_active do
      published_at { 61.days.ago }
    end
  end

  factory :admin do
    sequence :email do |n|
      "#{Faker::Internet.user_name}#{n}@example.org"
    end

    password { "password" }
    password_confirmation { "password" }
  end

  factory :viewer do
    client_hash { "asdfqwrogrwhoashogasdfgioha455" }
  end

  factory :user do
    sequence :email do |n|
      "#{Faker::Internet.user_name}#{n}@example.org"
    end
    name { "#{Faker::Name.name}" }
  end
end
