module JsonResponse
  def render_json(user, msg, success, status, loc)
    render json: {
      user: user,
      message: msg,
      is_success: success
    }, status: status, location: loc
  end
end
