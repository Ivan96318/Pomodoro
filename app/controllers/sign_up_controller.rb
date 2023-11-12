class SignUpController < ApplicationController
  skip_before_action :authorize
  
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    
    if @new_user.save
      # TODO: pending to redirect to inside of the application
      # TODO: pending of set to notice message to translation
      session[:user_id] = @new_user.id
      flash[:notice] = "Usuario creado con exito"
      redirect_to root_path
    else
      render(turbo_stream: turbo_stream.replace(
        @new_user, 
        partial: "sign_up/form", 
        locals: { new_user: @new_user}
      ), status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
