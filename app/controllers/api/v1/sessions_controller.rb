class SessionsController < ApplicationController
  before_filter :find_model

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
