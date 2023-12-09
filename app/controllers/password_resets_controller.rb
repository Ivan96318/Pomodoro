class PasswordResetsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :edit]
  before_action :check_for_session, only: :new
  
  def new
    @password_reset = PasswordReset.new
  end

  def create
    if params[:email].present?
      @user = User.find_by(email: params[:email])

      if @user.present?
        PasswordMailer.with(user: @user).reset.deliver_later
        redirect_to root_path, notice: "Se ha enviado un link a tu correo para restablecer tu contraseña"
      else
        password_reset = PasswordReset.new
        password_reset.errors.add(:base, "El correo proporcionaste no existe")
        render turbo_stream: turbo_stream.update(
          "password-reset-form",
          partial: "form",
          locals: { password_reset: password_reset }
        )
      end
    else
      password_reset = PasswordReset.new
      password_reset.errors.add(:base, "El correo no puede estar vacio")

      render turbo_stream: turbo_stream.update(
        "password-reset-form",
        partial: "form",
        locals: { password_reset: password_reset }
      )
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "Tu token ha expirado. Por favor intenta otra vez."
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if(@user.update(password_params))
      redirect_to login_path, notice: "Tu contraseña ha sido actualizada. Por favor inicia sesión"
    else
      password_recovery = PasswordRecovery.new
      password_recovery.errros.add(:base, "La contraseña debe de conicidir")
      render turbo_stream: turbo_stream.update(
        "password-reset-edit-form",
        partial: "form_edit",
        locals: { password_recovery: password_recovery }
      )
    end
  end

  private

  def password_params
  end
end
