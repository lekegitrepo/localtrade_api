module JsonResponse
  def render_json(message, is_success, user, status)
    render json: {
      messages: message,
      is_success: is_success,
      user: user
    }, status: status
  end
end
