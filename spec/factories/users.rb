FactoryBot.define do
  sequence :uid do |n|
    "#{n}"
  end

  factory :user do
    provider 'twitter'
    uid { generate(:uid) }
  end
end