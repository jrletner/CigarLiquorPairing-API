module Api
  module V1
    class UsersController < Api::V1::ApplicationController

      # skip authentication for create and login
      skip_before_action :authenticate, only: [:create, :login]

      def login
        # Step 1: get the result from the service
        result = Api::Auth.login(params[:email], params[:password], @ip)
        # Step 2: teturn an error if result was unsuccessful
        # return an error unless the result is success (true)
        render_error(errors: "There was a problem authenticating the user", status: 401) and return unless result.success?
        # Step 3: otherwise build a payload
        payload = {
          user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
          token: TokenBlueprint.render_as_hash(result.payload[:token]), status: 200,
        }
        # Step 4: return a successful response with payload
        render_success(payload: payload, status: 200)
      end

      def index
        users = User.all
        payload = {
          user: UserBlueprint.render_as_hash(users),
        }
        render_success(payload: payload, status: 200)
      end

      def create
        # Step 1: get the result from the service
        # use same folder / file name as service created
        result = Api::Users.new_user(params)
        # Step 2: return an error if result was unsuccessful
        # return an error unless the result is success (true)
        render_error(errors: "There was a problem creating a new user", status: 400) and return unless result.success?
        # Step 3: otherwise build a payload
        payload = {
          user: UserBlueprint.render_as_hash(result.payload),
        }
        # Step 4: return a successful response with payload
        render_success(payload: payload, status: 201)
      end

      def me
        render_success(payload: UserBlueprint.render_as_hash(@current_user), status: 200)
      end

      def logout
        result = Api::Auth.logout(@current_user, @token)
        render_error(errors: "There was a problem logging out", status: 401) and return unless result.success?
        render_success(payload: "You have been successfull logged out", status: 200)
      end

      def update
        result = Api::Users.update_user(params)
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          user: UserBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end
    end
  end
end
