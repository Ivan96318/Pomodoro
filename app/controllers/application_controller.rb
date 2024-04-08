# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_container

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    # TODO: quitar esto para usar un metodo que simule el inicio de sesión
    return true if Rails.env.test?

    redirect_to login_path, alert: 'No estas autorizado, inicia sesón' if current_user.nil?
  end

  def set_container
    @container = true
  end
end
