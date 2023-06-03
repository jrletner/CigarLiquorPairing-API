module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def login
      end

      def create
        user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])

        if user.save
          render json: { success: true, user: user, status: 201 }
        else
          render json: { errors: "There was a problem creating a new user", status: 400 }
        end
      end

      def me
      end

      def logout
      end
    end
  end
end
