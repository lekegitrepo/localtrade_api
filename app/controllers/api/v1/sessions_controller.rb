class Api::V1::SessionsController < ApplicationController
  before_action :load_user, only: :login
  # before_action :valid_token, only: [:destroy, :login]

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user.valid_password? user_password
      sign_in user
      user.generate_new_auth_token
      user.save
      session[:user_id] = user.id
      render_json 'Signed in', true, user, :ok, [:api_v1, user]
    else
      render_json 'Unable to Signed in: wrong email or password', false, {}, :unprocessable_entity
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

  # def destroy
  #   # @user.generate_new_auth_token
  #   # @user.save
  #   # @user = User.find_by authentication_token: params[:id]
  #   # @user.generate_new_auth_token
  #   # @user.save
  #   # sign_out @user
  #   # reset_session
  #   # render_json 'Successfully logged out', true, {}, :no_content
  # end

  def destroy
    user = User.find_by(authentication_token: params[:id])
    # user.generate_new_auth_token
    # user.save
    session[:user_id] = ''
    sign_out user
    reset_session
    head :no_content
  end

  private

  def load_user
    @user = User.find_for_database_authentication(email: params[:session][:email])

    return @user if @user

    render_json 'Unable to sign in: something went wrong!', false, {}, :failure
  end

  # def valid_token
  #   @user = User.find_by authentication_token: params[:id]

  #   return @user if @user

  #   render_json 'Invalid authentication', false, {}, :unprocessable_entity
  # end
end
