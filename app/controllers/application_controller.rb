class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden,                      with: :rescue403
  rescue_from StandardError,                  with: :rescue500
  rescue_from ActiveRecord::RecordNotFound,   with: :rescue404
  rescue_from ActionController::RoutingError, with: :rescue404

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def rescue403
    render template: 'errors/forbidden', status: :forbidden
  end

  def rescue404
    render template: 'errors/not_found', status: :not_found
  end

  def rescue500
    render template: 'errors/internal_sever_error', status: :internal_server_error
  end
end
