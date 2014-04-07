class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from NotAuthorizedError, with: :render_404

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    render file: "#{Rails.root}/public/404.html", status: 404, content_type: 'text/html'
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :role_id
    end
end
