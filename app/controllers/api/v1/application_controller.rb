class Api::V1::ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    # handles authenticating a user
    authenticate_token || render_unauthorized
  end

  def authenticate_token
  end

  def render_unauthorized
  end

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
