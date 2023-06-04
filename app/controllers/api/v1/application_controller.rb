class Api::V1::ApplicationController < ActionController::API
  def render_error(errors:, status: :internal_server_error)
    render json: {
             success: false,
             errors: errors,
             status: status,
           }, status: status
  end

  def render_success(payload:, status: :ok)
    render json: {
      success: true,
      payload: payload,
    }, status: status
  end
end
