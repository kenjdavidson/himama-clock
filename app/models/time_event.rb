# TimeEvent tracks in and out actions for a specified member
#
class TimeEvent < ApplicationRecord
  enum event_type: %i[clock_in clock_out]

  belongs_to :user

  before_validation :current_event_time

  validates :user, presence: true
  validates :event_time, presence: true
  validates :event_type, presence: true, inclusion: { in: event_types.keys }

  default_scope { order(event_time: :desc) }

  private

  def current_event_time
    self.event_time = Time.now unless event_time.present?
  end
end
