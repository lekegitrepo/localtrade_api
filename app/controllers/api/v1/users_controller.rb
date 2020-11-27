class Api::V1::UsersController < ApplicationController
  # respond_to :json

  def show
    user = User.find_by(id: params[:id])
    render_json 'Successfully Registered!', true, user, :ok # , [:api_v1, user]
  end
end
