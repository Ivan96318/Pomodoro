class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :check_for_session, only: [:new]

  def new
    @session = Session.new
    @container = false
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Bienvenido"
    else
      session = Session.new
      session.errors.add(:base, "Usuario o contraseña invalido")

      render turbo_stream: turbo_stream.update(
        "new-login-session",
        partial: "form",
        locals: {session: session}
      )
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
