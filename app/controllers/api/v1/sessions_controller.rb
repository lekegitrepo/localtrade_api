class Api::V1::SessionsController < ApplicationController
  before_action :load_user, only: :login
  before_action :valid_token, only: [:logout, :login]

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_new_auth_token
      user.save
      render_json 'Signed in', true, user, :ok, [:api_v1, user]
    else
      render_json 'Unable to Signed in: wrong email or password', false, {}, :unauthorized
    end
  end

  # Check if user is logged in
  def login
    if @user
      render_json 'Signed in Successfully', true, @user, :ok, [:api_v1, user]
    else
      render_json 'Unable to Signed in: wrong email or password', false, {}, :unauthorized
    end
  end

  def logout
    sign_out @user
    @user.generate_new_auth_token
    reset_session
    render_json 'Successfully logged out', true, {}, :ok
  end

  private

  def load_user
    @user = User.find_for_database_authentication(email: params[:session][:email])

    return @user if @user

    render_json 'Unable to sign in: something went wrong!', false, {}, :failure
  end

  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end

  def valid_token
    @user = User.find_by authentication_token: request.headers['AUTH-TOKEN']

    return @user if @user

    render_json 'Invalid authentication', false, {}, :unprocessable_entity
  end
end
