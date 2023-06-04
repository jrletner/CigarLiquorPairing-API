class Api::V1::ApplicationController < ActionController::API
  before_action :authenticate

  # get access to a set of methods that allows us to authenticate by parsing and validating tokens sent in Http headers
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    # handles authenticating a user
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    # get the user's ip for this instance or return unknown
    @ip = request.remote_ip || "unknown"
    # use ControllerMethod above to authenticate token
    authenticate_with_http_token do |token, _option|
      # Set an instance variable for token
      @token = Token.find_by(value: token)
      # if token is not found
      if @token.nil?
        render_unauthorized
      else
        # check and see if the token is not exired and revocation date is not blank
        if @token.expiry.after?(DateTime.now) && @token.revocation_date.blank?
          @current_user = @token.user
          @current_user
        else
          # if expired or no revocation date
          render_unauthorized
        end
      end
    end
  end

  def render_unauthorized
    logger.debug "*** UNAUTHORIZED REQUEST ***"
    render_error(errors: "Invalid credentials", status: 401)
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
      status: status,
    }, status: status
  end
end
