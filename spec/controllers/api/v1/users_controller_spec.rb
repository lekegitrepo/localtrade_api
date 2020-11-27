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
end
