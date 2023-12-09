class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_container

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_path, alert: "No estas autorizado, inicia sesón" if current_user.nil?
  end

  def set_container
    @container = true
  end

  def check_for_session
    redirect_to root_path, notice: "Ya iniciaste sessión" if session[:user_id]
  end
end
