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
        json = JSON.parse(response.body)
        p "This is user token: #{@user.authentication_token} json[:authentication_token]: #{json['id']}"
        expect(json['authentication_token']).to eql @user.authentication_token
      end

      # it 'returns the user record corresponding to the given credentials' do
      #   @user.reload
      #   p "This is user in the test: #{@user.authentication_token}"
      #   expect(json_response[:authentication_token]).to eql @user.authentication_token
      # end

      it { should respond_with 200 }
    end
  end
end