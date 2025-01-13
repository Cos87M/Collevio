class ApplicationController < ActionController::Base
  # Ensures that a user is authenticated before accessing any controller actions
  before_action :authenticate_user!
  # Includes Pundit's authorization methods to manage user permissions
  include Pundit::Authorization

   # Enforces Pundit's "allow-list" approach:
  # Verifies that `authorize` is called in all actions (except `index`).
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # Ensures `policy_scope` is used in the `index` action to scope data appropriately.
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private
  # Determines when to skip Pundit authorization checks.
  # Skips Pundit for:
  # - Devise controllers (e.g., authentication routes)
  # - Rails admin routes
  # - Static pages controllers (e.g., `pages` controller)
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
