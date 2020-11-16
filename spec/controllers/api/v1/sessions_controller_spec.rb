require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'POST #create' do
    before(:each) do
      @user = FactoryBot.create :user
    end
  end
end
