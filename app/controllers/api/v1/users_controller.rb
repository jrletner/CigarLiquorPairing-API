module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def login
      end

      def index
        user = User.all
        render json: UserBlueprint.render_as_hash(user)
      end

      def create
        user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])

        if user.save
          render_success(payload: { user: UserBlueprint.render_as_hash(user) }, status: :created)
        else
          render_error(errors: "There was a problem creating a new user", status: 400)
        end
      end

      def me
      end

      def logout
      end
    end
  end
end
