module JsonResponse
  def render_json(user, msg, success, status, loc)
    # render json: {
    #   messages: message,
    #   is_success: is_success,
    #   user: user
    # }, status: status, location: loc

    render json: user, message: msg, is_success: success, status: status, location: loc
  end
end
