FactoryBot.define do
  factory :event do
    user
    name 'TEST_NAME'
    place 'TEST_PLACE'
    start_time Date.current
    end_time Date.current + 1
    content 'TEST_CONTENT'
  end
end