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

    context 'Invalid user value' do
      before(:each) do
        @invalid_input = { password: '12355332', password_confirmation: '12355332' }
        post :create, params: { user: @invalid_input, format: :json }
      end

      it 'should render a json with error' do
        expect(json_response[:is_success]).to eql false
      end

      it 'should contain a json with an error key' do
        error_resp = json_response[:user]
        expect(error_resp).to have_key(:errors)
      end

      it "should contain an email error message: can't be blank" do
        error_resp = json_response[:user]
        expect(error_resp[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe 'PUT/PATCH #update' do
    context "Where user's record is successfully updated" do
      before(:each) do
        @user = FactoryBot.create :user
        patch :update, params: { id: @user.id,
                                 user: { email: 'newemail@gmail.com' },
                                 format: :json }
      end

      it 'should contain json with user new email' do
        user_resp = json_response[:user]
        expect(user_resp[:email]).to eql 'newemail@gmail.com'
      end

      it { should respond_with 202 }
    end
  end
end
