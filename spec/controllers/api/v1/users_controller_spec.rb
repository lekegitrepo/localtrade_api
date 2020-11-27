require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @user = FactoryBot.create :user
      get :show, params: { id: @user.id, format: :json }
    end

    it 'should return an information about a user' do
      user_resp = json_response[:user]
      expect(user_resp[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe 'POST #create' do
    before(:each) do
      @user_attr = FactoryBot.attributes_for :user
      post :create, params: { user: @user_attr, format: :json }
    end

    it 'should return the user record in json format' do
      user_json = json_response[:user]
      expect(user_json[:email]).to eql @user_attr[:email]
    end

    it { should respond_with 201 }
  end
end
