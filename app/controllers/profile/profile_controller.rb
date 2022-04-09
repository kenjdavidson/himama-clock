class Profile::ProfileController < ApplicationController
  include AuthenticatedConcern

  def show
    @time_events = current_user.time_events
  end
end
