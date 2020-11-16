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

  def load_user
    @user = User.find_for_database_authentication(email: user_params[:email])

    return @user if @user

    render_json 'Unable to sign in: something went wrong!', false, {}, :failure
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
