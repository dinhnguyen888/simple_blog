module Authorization
  extend ActiveSupport::Concern

  included do
    rescue_from AuthorizationError, with: :user_not_authorized
  end

  class AuthorizationError < StandardError; end

  private

  def require_admin!
    unless current_user&.admin?
      raise AuthorizationError, "You are not authorized to perform this action."
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end