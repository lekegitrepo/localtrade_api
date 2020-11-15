class Api::V1::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(user_params[:email])
  end

  def login
  end

  def logout
    reset_session
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
