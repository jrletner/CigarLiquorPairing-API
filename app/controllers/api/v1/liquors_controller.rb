module Api
  module V1
    class LiquorsController < Api::V1::ApplicationController
      def index
        liquor = Liquor.all
        render json: liquor
      end
    end
  end
end
