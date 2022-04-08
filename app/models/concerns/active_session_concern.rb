# Authenticated module standardizes User lookup based on the current session[:user_id].  This works
# in conjunction with the CurrentAttributes ThreadLocal session details.
#
# @see https://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html
#
# Attempts to check session[:user_id] and lookup User. If neither are available then
# the request is redirected to the login.
#
module ActiveSessionConcern
  extend ActiveSupport::Concern

  included do
    before_action :session_user
  end

  private

  def session_user
    if session[:user_id] && user = User.find(session[:user_id])
      Session.user = user
    end
  rescue ActiveRecord::RecordNotFound
    session.delete(:user_id)
  end
end
