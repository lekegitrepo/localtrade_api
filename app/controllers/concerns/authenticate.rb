# frozen_string_literal: true

module Authenticate
  # override Devise current_user method
  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
  end
end
