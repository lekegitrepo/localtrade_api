class Api::V1::SessionsController < Devise::SessionsController
  def create
  end

  def show
  end

  private

  def find_model
    @model = User.find(params[:id]) if params[:id]
  end

  def user_params

  end
end
