# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]
  before_action :check_for_session, only: [:new]

  def new
    @session = Session.new
    render layout: 'landing'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Bienvenido'
    else
      session = Session.new
      session.errors.add(:base, 'Usuario o contraseña invalido')

      render turbo_stream: turbo_stream.update(
        'new-login-session',
        partial: 'form',
        locals: { session: }
      )
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def check_for_session
    redirect_to root_path, notice: 'Ya iniciaste sessión' if session[:user_id]
  end
end
