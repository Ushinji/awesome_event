class Event < ApplicationRecord
  validates :name, presence: true
  validates :place, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
  validate :start_time_should_be_before_end_time

  private

  def start_time_should_be_before_end_time
    return unless start_time && end_time
    if start_time > end_time
      errors.add(:start_time, 'は終了時間よりも前に設定してください。')
    end
  end
end