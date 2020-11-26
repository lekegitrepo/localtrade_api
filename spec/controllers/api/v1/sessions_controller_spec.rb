require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryBot.create :user
    end

    context 'When user credentials are correct' do
      before(:each) do
        credentials = { email: @user.email, password: '123456789' }
        post :create, params: { session: credentials }
      end

      it 'returns the user record corresponding to the given credentials' do
        @user.reload
        user_obj = json_response[:user]
        expect(user_obj[:authentication_token]).to eql @user.authentication_token
      end

      it { should respond_with 200 }
    end

    context 'When user credentials are incorrect' do
      before(:each) do
        credentials = { email: @user.email, password: 'wrong_password' }
        post :create, params: { session: credentials }
      end

      it 'response with unauthorized' do
        p "user object: #{json_response}"
        expect(json_response[:is_success]).to eql false
      end

      it { should respond_with 422 }
    end
  end
end
