module AuthenticatedConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    redirect_to admin_path unless Session.user&.present?
  end
end
