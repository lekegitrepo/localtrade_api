class Api::V1::UsersController < ApplicationController
  # respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      render_json 'User Successfully Registered', true, user, :created, [:api_v1, user]
    else
      render_json 'Unable to register!', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render_json 'Successfully update user Profile', true, user, :accepted, [:api_v1, user]
    else
      render_json 'Unable to update user Profile', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render_json 'Profile', true, user, :ok # , [:api_v1, user]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end