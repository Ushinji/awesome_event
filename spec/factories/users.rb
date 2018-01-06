FactoryBot.define do
  
  factory :user do
    provider 'twitter'
    sequence(:uid) { |n| "#{n}" }
  end
end