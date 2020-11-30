# frozen_string_literal: true

module Authenticate
  # override Devise current_user method
  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
  end

  def authenticate_with_token
    unless user_signed_in?
      render_json 'Not Authenticated', false, { errors: 'Unauthorized' }, :unauthorized
    end
  end
end
