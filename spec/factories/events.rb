FactoryBot.define do
  factory :event do
    user
    sequence(:name) { |n| "TEST_NAME_#{n}" }
    sequence(:place) { |n| "TEST_PLACE_#{n}" }
    sequence(:start_time) { rand(1..30).days.from_now }
    sequence(:end_time) { start_time + rand(1..24).hour }
    sequence(:content) { |n| "TEST_CONTENT_#{n}" }
  end
end