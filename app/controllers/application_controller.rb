class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  include JsonResponse

  # protect_from_forgery
  # skip_before_action :verify_authenticity_token, if: :json_request?

  # protected

  # def json_request?
  #   request.format.json?
  # end
end
