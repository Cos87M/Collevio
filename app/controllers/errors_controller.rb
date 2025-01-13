class ErrorsController < ApplicationController
  # Handles 404 Not Found errors
  def not_found
    # Authorizes the action using Pundit (checks if the current user has access to view this error page)
    authorize :error, :not_found?

    # Renders the custom 404 error page from the 'public' directory
    # `layout: false` ensures that the layout is not used (just the raw HTML file)
    # `status: :not_found` sets the HTTP status code to 404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  # Handles 500 Internal Server errors
  def internal_server
    # Renders a generic 500 Internal Server Error page with the status code 500
    render status: 500
  end
end
