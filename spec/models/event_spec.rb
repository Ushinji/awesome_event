require "rails_helper"

describe "Event" do
  describe "#name" do
    subject{ build(:event) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "#place" do
    context "空白のとき" do
      it "validではないこと" do
        event = Event.new(place: '')
        event.valid?
        expect(event.errors[:place]).to be_present
      end
    end
  end

  describe "#start_time" do
    context "空白のとき" do
      it "validではないこと" do
        event = Event.new(start_time: '')
        event.valid?
        expect(event.errors[:start_time]).to be_present
      end
    end

    context "#end_timeより遅い" do
      it "validではないこと" do
        event = Event.new(start_time: Time.current, end_time: Time.current - 1)
        event.valid?
        expect(event.errors[:start_time]).to be_present
      end
    end
  end

  describe "#end_time" do
    context "空白のとき" do
      it "validではないこと" do
        event = Event.new(end_time: '')
        event.valid?
        expect(event.errors[:end_time]).to be_present
      end
    end
  end
end