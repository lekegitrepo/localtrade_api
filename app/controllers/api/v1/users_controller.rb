class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token, only: [:update, :show, :destroy]
  # respond_to :json

  def create
    p "THIS IS PARAMS: #{params}"
    user = User.new(user_params)
    if user.save
      render_json 'User Successfully Registered', true, user, :created, [:api_v1, user]
    else
      p "THIS IS USER ERRORS: #{user.errors[:email]}"
      render_json 'Unable to register!', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  def update
    # user = User.find(params[:id])
    user = current_user
    if user.update(user_params)
      render_json 'Successfully update user Profile', true, user, :accepted, [:api_v1, user]
    else
      render_json 'Unable to update user Profile', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render_json 'Profile', true, user, :ok # , [:api_v1, user]
    else
      render_json 'Unable to load user profile', false, {}, :unauthorized # , [:api_v1, user]
    end
  end

  def destroy
    # user = User.find_by(authentication_token: params[:id])
    # user.destroy
    current_user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
