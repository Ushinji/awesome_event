require "rails_helper"

describe "Event" do
  context "presenceのバリデーション" do
    subject{ build(:event) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:name) }
  end

  context "start_timeがend_timeより遅いとき" do
    it "validではないこと" do
      event = Event.new(start_time: Time.current, end_time: Time.current - 1)
      event.valid?
      expect(event.errors[:start_time]).to be_present
    end
  end
end