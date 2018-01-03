require "rails_helper"

describe "Event" do
  it "test" do
    event = FactoryBot.build(:event)
    event.name = 'TEST'
    event.place = 'PLACE'
    event.content = 'CONTENT'
    event.start_time = Time.current
    event.end_time = Time.current + 1
    expect(event).to be_valid
  end
end