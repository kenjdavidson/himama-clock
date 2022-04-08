class ApplicationController < ActionController::Base
  include ActiveSessionConcern

  helper_method :current_user
  helper_method :current_user?

  def current_user
    Session.user
  end

  def current_user?
    Session.user&.present?
  end
end
