# Provides Authentication (and Authorization) logic for ensuring there is a current user applied
# to the Sesssion.  This is done by providing the `before_action` of `authenticate` which will
# redirect to the admin_path (login).
#
module AuthenticatedConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  class_methods do
    def authorized_with(requested_role); end
  end

  private

  def authenticate
    redirect_to login_path unless Session.user&.present?
  end
end
