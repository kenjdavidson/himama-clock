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
  layout :punch_clock

  def index; end

  # Creates new TimeEvent by first setting the current time
  #
  def create; end
end
