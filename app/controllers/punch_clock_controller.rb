# Handles Punch Clock actions
#
# Available actions are:
# - showing the punch clock ui
# - accepting the punch clock request
#
# Punch clock requests require:
# - User.id
# - User.pincode
# - EventType
#
# and are populated with the current DateTime.
#
class PunchClockController < ApplicationController
  layout 'punch_clock'

  def index
    # Kill any current session to ensure people are logged out
    session.delete(:user_id)
    session.delete(:email)
  end

  # Creates new TimeEvent by first setting the current time
  #
  def create
    submit_time_event
    redirect_to root_path
  end

  private

  def submit_time_event
    user = User.find_by(email: params[:email])

    if user.authenticate_pincode(params[:pincode])
      user.time_events.create!(event_time: Time.now,
                               event_type: params[:event_type])
      flash[:success] = "#{user.full_name} #{event_description}"
    else
      flash[:danger] = 'Unable to authenticate user pincode'
    end
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Unable to find user'
  end

  def event_description
    case params[:event_type]
    when 'clock_in'
      'clocked in!'
    when 'clock_out'
      'clocked out!'
    end
  end
end
